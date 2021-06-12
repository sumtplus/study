package xyz.sumtplus.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import xyz.sumtplus.domain.AttachFileDTO;

/**
 * 첨부파일을 처리하는 컨트롤러 
 */
@Controller
@Log4j
public class UploadController implements ServletContextAware{
	private ServletContext ServletContext;
	// 기본 업로드 경로
	public static final String UPLOAD_PATH = "c:/upload/";
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.ServletContext = servletContext;
	}

	@GetMapping("upload")
	public void uploadForm() {
		log.info("upload get ....");
	}
	
	@GetMapping("uploadajax")
	public void uploadAjax() {
		log.info("uploadAjax get ....");
	}
	
	// uploadAction에서 post로 데이터를 받았을때 처리
	// MultipartFile배열을 파라미터로 받아서 첨부파일의 목록을 반환 
	// 인증된 사용자만 접근가능
	@PreAuthorize("isAuthenticated()")
	@PostMapping("uploadAction")
	public @ResponseBody List<AttachFileDTO> upload(MultipartFile[] files, Model model) throws IllegalStateException, IOException {
		// 오늘 날짜의 경로를 가진 파일객체생성
		File uploadPath = new File(UPLOAD_PATH, getFolder());
		// 폴더가 존재하지 않으면 생성
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		List<AttachFileDTO> list = new ArrayList<AttachFileDTO>();
		
		log.info("upload post ....");
		
		for(MultipartFile mf : files) {
			AttachFileDTO dto = new AttachFileDTO();
			log.info("...........................");
			log.info("upload file name :: " + mf.getOriginalFilename());
			log.info("upload file size :: " + mf.getSize());
			String uuid = UUID.randomUUID().toString();
			// uuid와 실제파일이름으로 uploadFileName 생성
			String uploadFileName = uuid + "_" + mf.getOriginalFilename();
			// 경로와 uploadFileName으로 파일객체 생성
			File saveFile = new File(uploadPath, uploadFileName);
			// 파일저장
			mf.transferTo(saveFile);
			
			dto.setFileName(mf.getOriginalFilename());
			dto.setUuid(uuid);
			dto.setUploadPath(getFolder());
			// 이미지일 경우 썸네일 생성
			if(isImageType(saveFile)) {
				FileOutputStream fos = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(mf.getInputStream(), fos, 100, 100);
				fos.close();
				dto.setImage(true);
			}
			list.add(dto);
		}
		return list;
	}
	
	// fileName을 파라미터로 받아서 이미지 데이터를 전송
	@GetMapping("display")
	public @ResponseBody ResponseEntity<byte[]> getFile(String fileName) throws IOException { 
		log.info("fileName : " + fileName);
		File file = new File(UPLOAD_PATH + fileName);
		log.info("file : " + fileName);
		HttpHeaders headers = new HttpHeaders();
		//파일의 mime타입을 헤더 메시지에 포함
		headers.add("Content-Type", Files.probeContentType(file.toPath())); //probeContentType 마임타입
		
		return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
	}
	// 첨부파일 다운로드 요청
	@GetMapping(value="download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE) // 마임타입
	public ResponseEntity<Resource> download(String fileName) throws UnsupportedEncodingException {
		log.info("download file :: " + fileName);
		
		//fileSystemResource 파일시스템의 특정파일로부터 정보를 얻어온다
		Resource resource = new FileSystemResource(UPLOAD_PATH + fileName);
		
		log.info("resource :: " + resource);
		
		String sourceName = resource.getFilename();
		// 파일이름에서 uuid를 자름
		sourceName = sourceName.substring(sourceName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		// 파일 다운로드시 저장되는 이름처리
		headers.add("Content-Disposition", "attachment; fileName=" + new String(sourceName.getBytes("UTF-8"),"ISO-8859-1"));
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	// uploadAction에서 post로 데이터를 받았을때 처리
	// attachFileDTO객체를 파라미터로 받아서 삭제요청
	// 인증된 사용자만 접근 가능
	@PreAuthorize("isAuthenticated()")
	@PostMapping("deleteFile")
	public @ResponseBody String deleteFile(@RequestBody AttachFileDTO dto) {
		log.info(dto);
		// 이미지 파일이 있을경우 썸네일까지 같이 삭제
		new File(UPLOAD_PATH, dto.getDownPath()).delete();
		if(dto.isImage()) {
			new File(UPLOAD_PATH, dto.getThumbPath()).delete();
		}
		return "deleted";
	}
	
	// 오늘 날짜를 문자열로 반환하는 메서드
	private String getFolder() {
		return new SimpleDateFormat("yyyy/MM/dd").format(new Date());
	}
	// 이미지 타입인지 검사하는 메서드
	private boolean isImageType(File file) throws IOException {
		String mime = Files.probeContentType(file.toPath());
		return mime != null && mime.startsWith("image");
	}
}













