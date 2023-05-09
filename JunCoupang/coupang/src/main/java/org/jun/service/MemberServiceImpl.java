package org.jun.service;

import org.jun.domain.MemberDTO;
import org.jun.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mmapper;
	
	// 회원가입 insert
	public void insert(MemberDTO mdto) {
		mmapper.insert(mdto);
	}
	
	// 아이디 중복체크
	public int idOver(MemberDTO mdto) {
		return mmapper.idOver(mdto);
	}
	
	// 로그인
	public MemberDTO login(MemberDTO mdto) {
		return mmapper.login(mdto);
	}
	// 아이디 비밀번호 확인
	public int idpwChk(MemberDTO mdto) {
		return mmapper.idpwChk(mdto);
	}
}
