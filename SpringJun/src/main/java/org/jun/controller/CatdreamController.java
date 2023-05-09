package org.jun.controller;


import org.jun.domain.Criteria;
import org.jun.domain.ProductDTO;
import org.jun.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CatdreamController {
	@Autowired
	private ProductService pservice;
	private static final Logger logger = LoggerFactory.getLogger(CatdreamController.class);


	@RequestMapping(value = "/catdream", method = RequestMethod.GET)  // 웹브라우저를 분석해주는 역할
	public String catdream() {
		logger.info("catdream 실행됨."); // console 역할
		return "catdream/index";
	}
	@RequestMapping(value = "/catdream", method = RequestMethod.POST)  // 웹브라우저를 분석해주는 역할
	public String catdreampost() {
		logger.info("catdreampost 실행됨."); // console 역할
		return "catdream/index";
	}
	
	// 주석 시험
	@GetMapping("/subcatdream")
	public String subcatdream() {
		logger.info("catdream 실행됨."); // console 역할
		
		
		return "catdream/subindex";
	}

	// 주석 시험
	@GetMapping("/brands")
	public String brands(Model model, ProductDTO pdto, Criteria cri) {
		model.addAttribute("list", pservice.list(cri));
		return "catdream/brands";
	}
}
