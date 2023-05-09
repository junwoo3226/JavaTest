package org.jun.service;

import java.util.ArrayList;

import org.jun.domain.ReplyDTO;
import org.jun.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper rmapper;
	//댓글 쓰기 설계된것을 구현
	public int write(ReplyDTO rdto) {
		//insert 성공시 Replymaller.로부터 1
		//insert 실패시 Replymaller.java로부터 0
		//값을 리턴받는다
		return rmapper.write(rdto);
	}
	//댓글 목록
	public ArrayList<ReplyDTO> list(int bno) {
		
		return rmapper.list(bno); 
	};
	
	//댓글 수정을 위해 덮어쓰기
	public ReplyDTO detail(int rno) {
		return rmapper.detail(rno);
	};
	
	//댓글수정 완료 구현
	public int update(ReplyDTO rdto) {
		return rmapper.update(rdto);
	};
	//댓글 삭제
	public int remove(ReplyDTO rdto) {
		return rmapper.remove(rdto);
	};
}
