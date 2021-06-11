package xyz.sumtplus.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;
import xyz.sumtplus.controller.UploadController;
import xyz.sumtplus.domain.BoardAttachVO;
import xyz.sumtplus.mapper.BoardAttachMapper;

@Component
@Log4j
public class FileCheckTask {
	@Autowired
	private BoardAttachMapper mapper;
	
	// 9시 30분 0초에 하겠다
	@Scheduled(cron="0 30 9 * * *") //모든 시간의 0초에 하겠다
	public void checkFiles() {
		log.warn("file check task run ............");
		log.warn("==============================================");
		
		List<BoardAttachVO> fileList = mapper.getOldFiles();
		if(fileList.size() == 0) return;
		
		log.warn("=================================");
		// action 이름 consumer 파라미터 한개, 리턴없음
		fileList.forEach(log::warn);
		//fileList.forEach(vo -> log.info(vo));
//		for(BoardAttachVO vo : fileList) {
//			log.info(vo);
//		}
		// map 지정 || function 한개의 입력, 하나의 리턴 || stream 순번이 있는 스트림화
		// path의 리스트, 파일타입의 리스트를 가져옴
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get(UploadController.UPLOAD_PATH, vo.getDownPath())).collect(Collectors.toList());
		fileList.stream().filter(vo-> vo.isImage()).map(vo -> Paths.get(UploadController.UPLOAD_PATH, vo.getThumbPath())).forEach(fileListPaths::add);
		log.warn("=================================");
		fileListPaths.forEach(log::warn);
		
		File targetDir = Paths.get(UploadController.UPLOAD_PATH, fileList.get(0).getUploadPath()).toFile();
		log.warn(targetDir);
		List<File> removeFiles = Arrays.asList(targetDir.listFiles(file -> !fileListPaths.contains(file.toPath())));
		removeFiles.forEach(file -> {
			log.warn("===================== 삭제될 파일 ========================");
			log.warn(file.getAbsolutePath());
			file.delete();
		});
	}
}









