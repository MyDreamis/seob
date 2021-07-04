package com.camp.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView member_mystory(CommunityVO m,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id=(String)session.getAttribute("id");
		if(id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인해주세요');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			int page = 1;
			int limit = 7;
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			int listcount = this.communityService.getListCount(m);
			
			m.setStartrow((page - 1) * 7 + 1);
			m.setEndrow(m.getStartrow() + limit - 1);
			
			List<CommunityVO> list=this.communityService.getCommunityList(m);
			
			int maxpage = (int)((double)listcount/limit + 0.95);
			
			int startpage = (((int)((double)page/10+0.9))-1)*10+1;
			
			int endpage = maxpage;
			if(endpage > startpage + 10-1) endpage = startpage + 10 -1;
			
			ModelAndView listC=new ModelAndView("./mystory/member_mystory");
			listC.addObject("page",page);
			listC.addObject("list",list);
			listC.addObject("startpage",startpage);
			listC.addObject("endpage",endpage);
			listC.addObject("maxpage",maxpage);
			listC.addObject("listcount",listcount);
			
			
			 return listC;
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
