package org.jun.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.jun.domain.MemberDTO;
import org.jun.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mservice;
    @Autowired
    private JavaMailSender mailSender;
	
    // 회원가입
	@GetMapping("member")
	public String member() {
		return "member/member";
	}
	
	// 회원가입 성공
	@PostMapping("member")
	public String member(MemberDTO mdto) {
		mservice.insert(mdto);
		return "redirect:/";
	}
	
	// 아이디 중복
	@ResponseBody
	@PostMapping("memberAjax")
	public int memberAjax(MemberDTO mdto){
		return mservice.idOver(mdto);
	}
	
    /* 이메일 인증 */
	@GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        System.out.println("이메일 데이터 전송 확인");
        System.out.println("이메일 주소 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 " + checkNum);
        

        
        /* 이메일 보내기 */
        String setFrom = "junwoo3226@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        return num;
    }
	
	// 로그인
	@GetMapping("login")
	public String login() {
		System.out.println("Get login 실행");
		return "member/login";
	}
	
	// 로그인 성공
	@ResponseBody
	@PostMapping("login")
	public int loginAjax(MemberDTO mdto,HttpSession session) {
		System.out.println("Post login 실행");
		int result = mservice.idpwChk(mdto);
		if(result == 1) {
			MemberDTO login= mservice.login(mdto);
			session.setAttribute("login", login); //로그아웃이나 웹브라우저를 닫지않는이상 데이터가 사라지지 않는다
			return result;
		}else { 
			return result;
		}
	}
	
	// 로그아웃
	@GetMapping("logout")  // 웹브라우저를 분석해주는 역할
	public String logout(HttpSession session) {
	   System.out.println("logout 실행됨");
	   session.invalidate();
	   return "redirect:/";
	}
	
	// 아이디찾기
	@GetMapping("idSearch")
	public String idSearch(Model model) {
		int result = 0;
		System.out.println("idSearch 실행됨 " + result);
    	model.addAttribute("idResult",result);
		return "member/idSearch";
	}
	
}
