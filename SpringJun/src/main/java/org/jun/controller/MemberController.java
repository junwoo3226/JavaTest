package org.jun.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.jun.domain.MemberDTO;
import org.jun.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService mservice;
	
	//JavaMailSender 객체 타입인 mailSender를 선언 이유는 이메일 보낼때 사용하기 때문에
	@Autowired
    private JavaMailSender mailSender;
	
	//로그인 창
		@RequestMapping(value = "/login", method = RequestMethod.GET)  // 웹브라우저를 분석해주는 역할
		public String login() {
			logger.info("login 실행됨."); // console 역할
			return "catdream/login";
		}
		
		//로그인 성공
		@ResponseBody
		@RequestMapping(value = "/login", method = RequestMethod.POST)  // 웹브라우저를 분석해주는 역할
		public int login(MemberDTO mdto,HttpSession session) {
		   logger.info("post-login 실행됨."); // console 역할
		   int result = mservice.idpwChk(mdto);
		   logger.info("result"+result);
		   //아이디와 비밀번호가 있다면 1
		   if(result == 1) {
			   MemberDTO login= mservice.login(mdto);
			   logger.info("MemberDTO안의 데이터 출력"+login);
			   session.setAttribute("login", login); //로그아웃이나 웹브라우저를 닫지않는이상 데이터가 사라지지 않는다
			   return result;
		   }else { 
			   
			   return result;
		   }
		} 
		
		//로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)  // 웹브라우저를 분석해주는 역할
		public String logout(HttpSession session) {
		   logger.info("get-logout 실행됨."); // console 역할
		   session.invalidate();
		   return "redirect:/catdream";
		}
		//아이디 중복 체크
		@ResponseBody
		@RequestMapping(value = "/idChk", method = RequestMethod.POST)  // 웹브라우저를 분석해주는 역할	
		public int idChk(MemberDTO mdto) {
			logger.info("idChk 실행됨 mdto=."+mdto); // console 역할
			int result = mservice.idChk(mdto);
			logger.info("result 결과는" +result); // console 역할
			return result;
		}
		//회원가입 기본창
		@RequestMapping(value = "/member", method = RequestMethod.GET)  // 웹브라우저를 분석해주는 역할	
		public String member() {
			logger.info("get-member 실행됨."); // console 역할
			//logger.info("mservice.getId()를 실행함."+mservice.getId()); //아이디의 값을 잘 가져온다

			return "catdream/member";
		}
		//회원가입이 완료가되었다면
		@RequestMapping(value = "/member", method = RequestMethod.POST)  // 웹브라우저를 분석해주는 역할	
		public String member(MemberDTO mdto) {
			logger.info("post-member 실행됨."); // console 역할
			
			//아이디 중복확인
			int result = mservice.idChk(mdto);
			try {
				if(result == 1) {
					//입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
					return "catdream/member";
				}else if(result == 0) {
					//service.register(vo); 존재하지 않는다면 -> register??
				}
			} catch(Exception e){
				throw new RuntimeException();
			}
			
			
			//if(mdto.getId()==mservice.getId()) {
			//	//여기서 비교는 가능한데 원하는 방법은아니다
			//}
			mservice.insert(mdto);			

			return "redirect:/catdream";
		}
		   
		//이메일 인증
	    @ResponseBody
	    @RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	    public String emailCheckGET(String email) throws Exception{
	        
	        //뷰(View)로부터 넘어온 데이터 확인
	        logger.info("이메일 데이터 전송 확인");
	        logger.info("인증번호 : " + email);
	        
	        //인증번호 생성 111111 ~ 999999
	        Random random = new Random();
	        int checkNum = random.nextInt(888888)+111111;
	        logger.info("인증번호 : " + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "hjg8012@naver.com";  	// root-context.xml에 삽입한 자신의 이메일 계정의 이메일 주소 이메일 주소로 입력해야한다
	        String toMail = email;				// 수신받을 이메일 이다
	        String title = "회원가입 인증 이메일 입니다.";// 자신이 보낼 이메일 제목을 작성
	        //자신이 보낼 이메일 내용
	        String content = 					
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	        //이메일을 보내주는 
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
	        
	        //인증번호를 String 형으로 바꿔 저장
	        String num = Integer.toString(checkNum);
	        return num;
	    }
	    
		//아이디 찾기 실행
	    @RequestMapping(value="/infoSearch", method=RequestMethod.GET)
	    public String infoSearch(Model model) {
	    	logger.info("/infoSearch 아이디찾기 실행");

	    	int result = 0;
	    	logger.info("result : "+result);
	    	model.addAttribute("idResult",result);
	    	
	    	return "catdream/infoSearch";	    	
	    	
	    }
	    //아이디 찾기 버튼클릭
	    @RequestMapping(value="/idSearch", method=RequestMethod.POST)
	    public String idSearch(MemberDTO mdto,Model model) {
	    	logger.info("idSearch 아이디찾기 버튼클릭");
	    	
	    	logger.info("idSearch 실행됨 mdto=."+mdto);
	    	
	    	ArrayList<String> ids = mservice.idSearch(mdto);
	    	model.addAttribute("ids",mservice.idSearch(mdto));
	    	logger.info("idSearch 실행됨 id=."+ids);
	    	
	    	return "catdream/idSearchShow";
	    }
	
	    
	    //비밀번호 찾기의 아이디 입력
	    @RequestMapping(value="/idInput", method=RequestMethod.GET)
	    public String idInput() {
	    	logger.info("idInput 비밀번호찾기 실행");
	    	
	    	return "catdream/idInput";
	    }

	    //비밀번호 이메일입력창 띄우기
	    @RequestMapping(value="/infoSearch", method=RequestMethod.POST)
	    public String infoSearch(MemberDTO mdto,Model model) {
	    	logger.info("/infoSearch 비밀번호찾기 실행");
	    	
	    	logger.info("id : "+mdto.getId());
	    	
	    	int result = mservice.idChk(mdto);
	    	logger.info("result : "+result);
	    	model.addAttribute("id",mdto.getId());
	    	model.addAttribute("idResult",result);
	    	
	    	if(result == 1) {
	    		return "catdream/infoSearch";	    		
	    	}
	    	else {
	    		//아이디를 입력하라는 창을 안뛰워준다
	    		return "catdream/idInput";
	    	}
	    }
	    
	  //비밀번호 찾기 버튼클릭
	    @RequestMapping(value="/passwordReset", method=RequestMethod.POST)
	    public String passwordReset(MemberDTO mdto,Model model) {
	    	logger.info("passwordReset 비밀번호찾기 버튼클릭");
	    	
	    	logger.info("비밀번호의 아이디 이름 이메일 확인?"+mservice.pwSearch(mdto));
	    	model.addAttribute("id",mdto.getId());
	    	
	    	return "catdream/passwordReset";
	    }
	    
		 //비밀번호 변경
	    @RequestMapping(value="/passwordResetGo", method=RequestMethod.POST)
	    public String passwordResetGo(MemberDTO mdto) {
	    	logger.info("passwordResetGo 비밀번호 재생성 클릭");
	    	//내용변경
	    	//비밀번호 저장된걸로 변경
	    	logger.info("바뀌는 비밀번호는?"+mdto);
	    	mservice.updatePassword(mdto);
	    	
	    	return "/catdream/index";
	    }
	    
	    
	    
	    
	    
	
}
