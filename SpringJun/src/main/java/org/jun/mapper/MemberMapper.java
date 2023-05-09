package org.jun.mapper;

import java.util.ArrayList;

import org.jun.domain.MemberDTO;

public interface MemberMapper {
	
	public void insert(MemberDTO mdto);
	
	public MemberDTO login(MemberDTO mdto);
	
	public ArrayList<String> getId();
	
	public int idpwChk(MemberDTO mdto);
	
	public int idChk(MemberDTO mdto);
	
	public ArrayList<String> idSearch(MemberDTO mdto);
	
	public MemberDTO pwSearch(MemberDTO mdto);
	
	public void updatePassword(MemberDTO mdto);
	
}
