package org.jun.controller;

import org.jun.domain.ReplyDTO;
import org.jun.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("replies")
public class ReplyController {
	
	@Autowired
	private ReplyService rservice;
	
	@PostMapping(value="new",consumes="application/json",produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO rdto){
		System.out.println("ReplyDTO="+rdto);

		int result = rservice.write(rdto);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)					 
					    : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
		
	}
	
	@PutMapping(value="update",consumes="application/json",produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> update(@RequestBody ReplyDTO rdto){

		System.out.println("rdto"+rdto);
		
		return rservice.update(rdto)==1? new ResponseEntity<>("success",HttpStatus.OK)					
			    						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@DeleteMapping(value="remove",consumes="application/json",produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ReplyDTO rdto){

		System.out.println("rdto"+rdto);
		
		return rservice.remove(rdto)==1? new ResponseEntity<>("success",HttpStatus.OK)					
			    						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
