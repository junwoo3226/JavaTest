package org.jun.mapper;

import java.util.ArrayList;

import org.jun.domain.ReplyDTO;

public interface ReplyMapper {
	//댓글 쓰기 설계
	public int write(ReplyDTO rdto);
	//댓글 목록
	public ArrayList<ReplyDTO> list(int bno);
	//댓글 수정을 위해 덮어쓰기
	public ReplyDTO detail(int rno);
	//댓글수정 완료 설계
	public int update(ReplyDTO rdto);
	//댓글 삭제
	public int remove(ReplyDTO rdto);
}
