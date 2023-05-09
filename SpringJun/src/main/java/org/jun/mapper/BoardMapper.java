package org.jun.mapper;

import java.util.ArrayList;

import org.jun.domain.BoardDTO;
import org.jun.domain.Criteria;
import org.jun.domain.ReplyDTO;

public interface BoardMapper {
	public void write(BoardDTO bdto);
	
	public void insertSelectKey(BoardDTO board);
	
	public BoardDTO detail(BoardDTO bdto);
	
	public void cntupdate(BoardDTO board);
	
	public void modify(BoardDTO bdto);
	
	public ArrayList<BoardDTO> list(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void remove(BoardDTO bdto);
	
	// 게시물 선택삭제
	public void ajaxRemove(String remove);
	
	//댓글 리스트 가져오기
	public ArrayList<ReplyDTO> reply(ReplyDTO rdto);

}
