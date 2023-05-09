package org.jun.service;

import java.util.ArrayList;

import org.jun.domain.AttachFileDTO;
import org.jun.domain.BoardDTO;
import org.jun.domain.Criteria;
import org.jun.domain.ReplyDTO;
import org.jun.mapper.AttachMapper;
import org.jun.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper bmapper;
	@Autowired
	private AttachMapper amapper;
	
	@Transactional
	public void write(BoardDTO bdto) {
		//제목과 내용을 board테이블에 insert
		if(bdto.getAttachList()!=null) {
			bmapper.insertSelectKey(bdto);
			//파일명,파일경로,파일타입,uuid 값을 attach테이블에 insert
			//BoardDTO에 있는 AttachList를 가져와서 AttackDTO 반복문으로 하나씩 넣음
			bdto.getAttachList().forEach(attach->{
				//BoardDTO의 bno값을 가져와서 AttachFileDTO에 bno 저장
				attach.setBno(bdto.getBno()); 
				amapper.insert(attach);
			});
		} else {
			bmapper.write(bdto);
		}
	}
	
	@Transactional
	public BoardDTO detail(BoardDTO bdto) {
		bmapper.cntupdate(bdto);
		return bmapper.detail(bdto);
	}
	
	public void modify(BoardDTO bdto) {
		bmapper.modify(bdto);
	}
	public ArrayList<BoardDTO> list(Criteria cri) {
		return bmapper.list(cri);
	
	}
	public int getTotalCount(Criteria cri) {
		return bmapper.getTotalCount(cri);
	}
	
	public void remove(BoardDTO bdto) {
		bmapper.remove(bdto);
	}
	
	//댓글 리스트 가져오기
	public ArrayList<ReplyDTO> reply(ReplyDTO rdto){
		return bmapper.reply(rdto);
	}
		
	// 게시물 선택삭제
	public void ajaxRemove(String remove) {
		bmapper.ajaxRemove(remove);
	}
	

	public ArrayList<AttachFileDTO> fileList(int bno){
		return amapper.fileList(bno);
	}
	
}
