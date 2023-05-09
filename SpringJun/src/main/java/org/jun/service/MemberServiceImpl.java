package org.jun.service;

import java.util.ArrayList;

import org.jun.domain.MemberDTO;
import org.jun.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mmapper;
	
	public void insert(MemberDTO mdto) {
		mmapper.insert(mdto);
	}
	
	public MemberDTO login(MemberDTO mdto){

		return mmapper.login(mdto);
	}
	
	public ArrayList<String> getId() {
		return mmapper.getId();
	}
	
	public int idpwChk(MemberDTO mdto) {
		return mmapper.idpwChk(mdto);
	}
	
	public int idChk(MemberDTO mdto) {
		return mmapper.idChk(mdto);
	}
	
	public ArrayList<String> idSearch(MemberDTO mdto) {
		return mmapper.idSearch(mdto);
	}
	
	public MemberDTO pwSearch(MemberDTO mdto) {
		return mmapper.pwSearch(mdto);
	}
	
	public void updatePassword(MemberDTO mdto) {
		 mmapper.updatePassword(mdto);
	}
	
}
