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

@Controller
@Log4j
public class UploadController implements ServletContextAware{
	private ServletContext ServletContext;
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
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("uploadAction")
	public @ResponseBody List<AttachFileDTO> upload(MultipartFile[] files, Model model) throws IllegalStateException, IOException {
		//String uploadFolder = ServletContext.getRealPath("upload");
		//String uploadFolder = "c:/upload";
		
		// make folder
		/*
		 * file객체 경로와 경로? 아니면 경로와 파일이름?으로생성
		 */
		File uploadPath = new File(UPLOAD_PATH, getFolder());
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
			String uploadFileName = uuid + "_" + mf.getOriginalFilename();
			File saveFile = new File(uploadPath, uploadFileName);
			mf.transferTo(saveFile);
			
			dto.setFileName(mf.getOriginalFilename());
			dto.setUuid(uuid);
			dto.setUploadPath(getFolder());
			
			if(isImageType(saveFile)) { // 이미지일 경우
				FileOutputStream fos = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(mf.getInputStream(), fos, 100, 100);
				fos.close();
				dto.setImage(true);
			}
			list.add(dto);
		}
		return list;
	}
	
	@GetMapping("display")
	public @ResponseBody ResponseEntity<byte[]> getFile(String fileName) throws IOException { //String을 리턴하는것과 비슷
		log.info("fileName : " + fileName);
		File file = new File(UPLOAD_PATH + fileName);
		log.info("file : " + fileName);
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-Type", Files.probeContentType(file.toPath())); //probeContentType 마임타입
		
		return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
	}
	
	@GetMapping(value="download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> download(String fileName) throws UnsupportedEncodingException {
		log.info("download file :: " + fileName);
		/*
		 * resource 인터페이스는 무엇인가?
		 * fileSystemResource 파일시스템의 특정파일로부터 정보를 얻어온다
		 */
		Resource resource = new FileSystemResource(UPLOAD_PATH + fileName);
		
		log.info("resource :: " + resource);
		
		String sourceName = resource.getFilename();
		//sourceName = sourceName.substring(sourceName.lastIndexOf("_")+1);
		sourceName = sourceName.substring(sourceName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-Disposition", "attachment; fileName=" + new String(sourceName.getBytes("UTF-8"),"ISO-8859-1"));
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("deleteFile")
	public @ResponseBody String deleteFile(@RequestBody AttachFileDTO dto) {
		log.info(dto);
		
		new File(UPLOAD_PATH, dto.getDownPath()).delete();
		if(dto.isImage()) {
			new File(UPLOAD_PATH, dto.getThumbPath()).delete();
		}
		/*
		 * 응답으로 deleted를 리턴한다? 무슨뜻
		 */
		return "deleted";
	}
	
	private String getFolder() {
		//return new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd").format(new Date());
		return new SimpleDateFormat("yyyy/MM/dd").format(new Date());
	}
	
	private boolean isImageType(File file) throws IOException {
		String mime = Files.probeContentType(file.toPath());
		// probeContentType 해당파일의 mime타입을 문자열로 반환 ex) image/jpeg, image/png
		// startsWith("") ""문자열로 시작하는지 체크
		//return Files.probeContentType(file.toPath()).startsWith("image");
		return mime != null && mime.startsWith("image");
	}
}













