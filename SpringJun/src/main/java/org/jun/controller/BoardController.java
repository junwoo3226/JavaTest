package org.jun.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.jun.domain.AttachFileDTO;
import org.jun.domain.BoardDTO;
import org.jun.domain.Criteria;
import org.jun.domain.PageDTO;
import org.jun.domain.ReplyDTO;
import org.jun.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService bservice;
	
	//게시판 목록 리스트 
	@GetMapping("board")
	public String list(Criteria cri,Model model) {
		System.out.println("tablelist" + bservice.list(cri));
		model.addAttribute("list", bservice.list(cri));
		
		model.addAttribute("pageMaker", new PageDTO(cri, bservice.getTotalCount(cri)));
		return "catdream/board/board";
	}
	
	
	//test
	//글쓰기 화면으로
	@GetMapping("write")
	public String write() {
		System.out.println("board/write");
		
		return "catdream/board/write";
	}
	
	@PostMapping("write")
	public String writePost(BoardDTO bdto) {
		
		bservice.write(bdto);
		System.out.println(bdto);
		return "redirect:/board/board";
	}
	
	
	//게시판 목록 리스트에서 제목을 클릭하면
	@GetMapping("boardDetail")
	public String detail(BoardDTO bdto,ReplyDTO rdto,AttachFileDTO adto,Model model) {
		model.addAttribute("detail", bservice.detail(bdto));
		model.addAttribute("reply", bservice.reply(rdto));
		return "catdream/board/boardDetail";
	}
	
	//게시판 상세페이지에서 이미지를 출력하기 위한 select된 결과를 javascript로
	@GetMapping(value="fileList/{bno}",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ArrayList<AttachFileDTO>> fileList(@PathVariable int bno){
		
		return new ResponseEntity<>(bservice.fileList(bno),HttpStatus.OK);
	}

	//글수정 화면
	@GetMapping("modify")
	public String modify(BoardDTO bdto, Model model) {
		
		model.addAttribute("detail",bservice.detail(bdto));
		return "catdream/board/modify";
	}
	
	@PostMapping("modify")
	public String modify(BoardDTO bdto,RedirectAttributes rttr ) {	
		bservice.modify(bdto);
	      rttr.addAttribute("bno", bdto.getBno());
		return "redirect:/board/boardDetail";
	}
	
	// 게시물 삭제
	@GetMapping("remove")
	public String remove(BoardDTO bdto,Model model) {
		bservice.remove(bdto);
		return "redirect:/board/board";
	}
	
	// 게시물 선택 삭제
	@PostMapping("remove")
	public String ajaxRemove(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			bservice.ajaxRemove(ajaxMsg[i]);
		}
		return "redirect:/board/board";
	}
	
	
}
