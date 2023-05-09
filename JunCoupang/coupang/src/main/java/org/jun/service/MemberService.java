package org.jun.service;

import org.jun.domain.MemberDTO;

public interface MemberService {
	// 회원가입 insert
	public void insert(MemberDTO mdto);
	// 아이디 중복체크
	public int idOver(MemberDTO mdto);
	// 로그인
	public MemberDTO login(MemberDTO mdto);
	// 아이디 비밀번호 확인
	public int idpwChk(MemberDTO mdto);
}
