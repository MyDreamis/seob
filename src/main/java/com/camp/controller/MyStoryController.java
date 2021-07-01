package com.camp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.service.CommunityService;
import com.camp.service.MyStoryService;
import com.camp.vo.CommunityVO;

@Controller
public class MyStoryController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private MyStoryService myStoryService;
	
	@GetMapping("member_mystory")
	public ModelAndView member_mystory(CommunityVO c,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id=(String)session.getAttribute("id");
		if(id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인해주세요');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			List<CommunityVO> list=this.communityService.getCommunityList(c);
			
			ModelAndView mlist=new ModelAndView("./mystory/member_mystory");
			mlist.addObject("list",list);
			
			return mlist;
		}
		return null;
	}
	@GetMapping("member_mystory_write")
	public String member_mystory_write(HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id=(String)session.getAttribute("id");
		
		if(id==null) {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			return "./mystory/member_mystory_write";
		}
		
		return null;
	}

}
