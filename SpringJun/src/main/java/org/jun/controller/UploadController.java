package org.jun.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.jun.domain.AttachFileDTO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {

	// 년/월/일 폴더의 생성
	private String getFolder() {
		
		//현재날짜를 추출
		Date date = new Date();
		
		// 출력: Tue Jan 18 09:34:09 KST 2022 >2022-01-18(yyyy-mm-dd방식으로)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(date); // 2022-01-18
		
		return str.replace("-", File.separator); //문자열 중 '-'를 파일 구분자로(\)로 바꾼다
	}
	// 썸네일 이미지 생성을 할 것인지 안할것인지에 대해 판단하는 메서드
	private boolean checkImage(File file) {
		try {
			//파일의 타입을 알아내는 메서드 호출
			String contentType=Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}
	
	
	//ajax를 이용한
	@PostMapping(value="uploadAjaxAction",produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ArrayList<AttachFileDTO>> uploadAjaxAction(MultipartFile[] uploadFile) {
		
		//
		ArrayList<AttachFileDTO> list = new ArrayList<>();
		
		//파일 업로드할 경로지정
		String uploadFolder="C:\\upload";
			
		//폴더 생성                                기존폴더        ,   현재 폴더를 결합
		File uploadPath = new File(uploadFolder, getFolder());
		
		String uploadFolderPath=getFolder();
		System.out.println("uploadPath"+uploadPath);
		
		//현재 만들려고하는 폴더가 없으면 
		if(uploadPath.exists()==false) {
			//폴더 생성
			uploadPath.mkdirs(); //mkdirs= make directroies
		}
		
		
		
		for(MultipartFile multipartFile : uploadFile) {
		System.out.println("파일이름 = "+multipartFile.getOriginalFilename()); //파일이름
		System.out.println("파일타입 = "+multipartFile.getContentType());		//jpg? png?
		System.out.println("파일용량 = "+multipartFile.getSize());			//파일 용량
		
		//업로드하는 파일명
		String uploadFileName=multipartFile.getOriginalFilename();
		
		//모델을 포함관계로
		AttachFileDTO attachdto= new AttachFileDTO();
				
		attachdto.setFileName(uploadFileName);
		//uuid에 중복이 되지않는 문자열을 만드는 클래스 메서드를 대입
		UUID uuid = UUID.randomUUID();
		//uuid를 string으로 변환해서 모델에 저장
		attachdto.setUuid(uuid.toString());
		//실제 업로드 경로를 모델에 저장
		attachdto.setUploadPath(uploadFolderPath);

		//+ 연산자를 이용해 abc.jpg 앞에 문자열 추가
		//UUID + "_" + getOriginalFilename() 의 조합으로 파일명 생성
		uploadFileName=uuid.toString()+"_"+ uploadFileName;		
	
			//서버에 올리거나 빼는 출력클래스(파일명만)
			File saveFile = new File(uploadPath,uploadFileName);
			
			try {
				//파일을 실제 경로에 보내는 메서드
				multipartFile.transferTo(saveFile);

				//이미지파일이면
				//썸네일 파일을 생성해서 보내라
				if(checkImage(saveFile)) {
					//FileType값이 이미지이면 1, model에 저장
					attachdto.setImage(true);
					
					//썸네일 파일명 추출
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					//썸네일 파일 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					//썸네일 종료(메모리 공간 환수) 정리 개념
					thumbnail.close();
				}
				list.add(attachdto);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} //for문 끝
		// 통신상태가 정상적이면 ArrayList에 저장되어 있는 값을 uploadAjax.js 에있는 success로 보내라(js의 result)값으로 들어감
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	//업로드한 파일타입이 이미지일 때 웹브라우저에 이미지를 띄우기 위해서
	@GetMapping("display")
	public ResponseEntity<byte[]> getFile(String fileName) { //getFile()은 문자열로 파일의 경로가 포함된 fileName을 매개변수로 받고
		                                                     //byte[](이진수)로 전송
		System.out.println("url주소를 통한 fileName="+fileName);
		
		File file = new File("C:\\upload\\" +fileName);
		
		System.out.println("file"+file);
		
		ResponseEntity<byte[]> result = null;
		
		//byte[]로 이미지 파일의 데이터를 전송할 때 브라우저에 보내는 MIME타입이 어떤 파일형식인지에 따라 달라짐
		//(브라우저에서 파일에 따라 자동으로 처리할 수 있게 끔 각 파일에 대한 처리 방식ㅇ ㅣ다름)
		//따라서 브라우저 내에서 따로 MIME타입을 가지고 구분함
		//이 부분을 해결하기위해서 probeContentType()을 이용해서 MIME 타입 데이터를 Http의 헤더메시지에 포함할 수 있도록 처리
		
		
		try {
			HttpHeaders header = new HttpHeaders();
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	// 업로드한 파일타입이 이미지가 아닐때(.xls .ppt, .txt)     //브라우저로 보낼때 다운가능한 타입으로 보내는것
	//Mapping할 때 우리가 원하는 데이터 타입을 강제함으로써 오류상황을 줄일 수 있다.
	//consume : 들어오는 데이터 타입 정의
	//produce : 변환하는 데이터 타입 정의
	// 생략하게 되면 웹 브라우저가 알아서 판단
	// 웹브라우저가 이 파일은 다운로드해야하는 파일이라는 것을 인지할 수 있도록 변환이 되어야합니다.
	// 그러기위해서는 APPLICATION_OCTET_STREAM_VALUE 타입으로 변환데이터 타입을 선언합니다.
	@GetMapping(value="download",produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	   public ResponseEntity<Resource> downloadFile(String fileName) {
	      System.out.println("download fileName = " + fileName);
	      
	      Resource resource = new FileSystemResource("C:\\upload\\" + fileName);
	      
	      System.out.println("download resource = " + resource);
	      
	      String resourceName = resource.getFilename();
	      
	      HttpHeaders header = new HttpHeaders();
	      
	      try {
	         header.add("Content-Disposition", "attachment; fileName = " + new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return new ResponseEntity<Resource>(resource,header,HttpStatus.OK);
	   }

	
	
}









