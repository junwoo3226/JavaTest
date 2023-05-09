package org.jun.mapper;

import java.util.ArrayList;

import org.jun.domain.AttachFileDTO;

public interface AttachMapper {
	//게시판 글쓰기 할때 파일과 관련되어 있는 ATTACH테이블에 insert
	public void insert(AttachFileDTO afd);
	//게시판 상세페이지에 업로드된 이미지를 올리기 위한 데이터LIST
	public ArrayList<AttachFileDTO> fileList(int bno);
}
