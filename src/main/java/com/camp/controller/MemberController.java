package com.camp.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.service.MemberService;
import com.camp.vo.MemberVO;

import pwdconv.PwdChange;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("member_login")
	public ModelAndView member_login() {
		
		return new ModelAndView("member/member_login");
	}
	
	@RequestMapping("member_join")
	public ModelAndView member_join() {
		String phone[]= {"010","011"};
		String email[]= {"직접 입력","naver.com","daum.net","google.com"};		
		
		ModelAndView mj=new ModelAndView();
		mj.addObject("phone",phone);
		mj.addObject("email",email);
		mj.setViewName("member/member_join");
		return mj;
	}
	
	@RequestMapping("member_idCheck")
	public String member_idCheck(String id,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		MemberVO db_id=this.memberService.idCheck(id);
		
		int re=-1;
		if(db_id != null) {
			re=1;
		}
		out.println(re);
		return null;
	}
	
	@PostMapping("member_join_ok")
	public String member_join_ok(MemberVO m,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println(m.getPwd());
		m.setPwd(PwdChange.getPassWordToXEMD5String(m.getPwd()));
		
		this.memberService.insertMember(m);
		out.println("<script>");
		out.println("alert('회원가입 되었습니다');");
		out.println("</script>");
		
	
		return "redirect:/member_login";
	}
	
	@PostMapping("member_login_ok")
	public String member_login_ok(String id,String pwd,HttpServletResponse response, HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		MemberVO m=this.memberService.login_ok(id);
		
		if(m == null) {
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!m.getPwd().equals(PwdChange.getPassWordToXEMD5String(pwd))) {
				out.println("<script>");
				out.println("alert('비번이 틀립니다');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				session.setAttribute("id", id);
				return "redirect:/member_main";
			}
		}
		
		return null;
	}
	@GetMapping("member_main")
	public String member_main(HttpServletResponse response,HttpSession session) throws Exception {

			return "./member/member_main";
	}
	@GetMapping("member_logout")
	public String member_logout(HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		session.invalidate();
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다');");
		out.println("location='member_login';");
		out.println("</script>");


		return null;
	}
	
}
