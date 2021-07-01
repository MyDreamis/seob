package com.camp.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.service.CommunityService;
import com.camp.vo.CommunityVO;
import com.camp.vo.ReplyVO;
import com.oreilly.servlet.MultipartRequest;

import oracle.net.aso.i;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("community_list")
	public ModelAndView community_list(CommunityVO m,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id=(String)session.getAttribute("id");
		if(id == null) {
			out.println("<script>");
			out.println("alert('�α����� ���ּ���');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
		
		int page=1;
		int limit=7;
		if(request.getParameter("page") != null) {//GET���� ���޵� �ʹ�ȣ�� �ִ� ��� ����
			page=Integer.parseInt(request.getParameter("page"));//�ʹ�ȣ�� ���� ���ڷ� ����
		}
		String find_name=request.getParameter("find_name");//�˻���
		String find_field=request.getParameter("find_field");//�˻�
		
		m.setFind_field(find_field);
		m.setFind_name("%"+find_name+"%");
		// %�� ����Ŭ ���ϵ� ī�� ���ڷμ� �ϳ� �̻��� ������ ���ڿ� ���� ����
		
		int listcount=this.communityService.getListCount(m);
		
		m.setStartrow((page-1)*7+1);
		m.setEndrow(m.getStartrow()+limit-1); //�����ȣ
		
		List<CommunityVO> list=this.communityService.getCommunityList(m);
		
		//�� ������ ��
		int maxpage=(int)((double)listcount/limit+0.95);
		
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView listC=new ModelAndView("./community/community_list");
		listC.addObject("page",page);
		listC.addObject("list",list);
		listC.addObject("startpage",startpage);
		listC.addObject("endpage",endpage);
		listC.addObject("maxpage",maxpage);
		listC.addObject("listcount",listcount);
		listC.addObject("find_field",find_field);
		listC.addObject("find_name",find_name);
		
		
		 return listC; 
	}
		return null;
}

	@RequestMapping("community_write")
	public String community_write(HttpServletResponse response,HttpSession session, Model m,HttpServletRequest request) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id=(String)session.getAttribute("id");
		
		if(id == null) {
			out.println("<script>");
			out.println("alert('�α����� ���ּ���');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			m.addAttribute("id",id);
			m.addAttribute("page",page);
			return "./community/community_write";
		}
		return null;
	}
	
	@PostMapping("community_write_ok")
	public ModelAndView community_write_ok(CommunityVO cm,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String id=(String)session.getAttribute("id");
			
			if(id == null) {
				out.println("<script>");
				out.println("alert('�α����� ���ּ���');");
				out.println("location='member_login';");
				out.println("</script>");
			}else {
			String saveFolder=request.getRealPath("resources/upload");
			
			int fileSize = 200*1024*1024;
			MultipartRequest multi = null;
			
			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
			
			int page=1;
			if(multi.getParameter("page")!=null) {
				page=Integer.parseInt(multi.getParameter("page"));
			}
			String c_id = multi.getParameter("c_id");
			String c_title = multi.getParameter("c_title");
			String c_cont = multi.getParameter("c_cont");
			
			File UpFile=multi.getFile("c_file");
			
			if(UpFile != null) {
				String fileName = UpFile.getName();
				Calendar c=Calendar.getInstance();
				int year=c.get(Calendar.YEAR);
				int month=c.get(Calendar.MONTH);
				int date=c.get(Calendar.DATE);
				
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
				File path1=new File(homedir);
				
				if(!(path1.exists())) {
					path1.mkdir();
				}
				
				Random r =new Random();
				int random=r.nextInt(100000000);
				
				int index = fileName.lastIndexOf("."); 
				//÷�ε� ���ϸ��� ��ħȿ�� �ǿ����ʺ��� ã�Ƽ� ���� ���� ������ ��ħǥ ��ġ��ȣ�� �� ���ʿ��� ���� ���(0���� ����) ��ġ��ȣ���� ����
				
				String fileExtendsion=fileName.substring(index+1);//��ħǥ ���ĺ��� ������ ���ڱ��� ����. �� ÷�ε� ���ϸ��� Ȯ���ڸ� ���ؼ� ����
				String refileName="c"+year+month+date+random+"."+fileExtendsion; //���ο� �������ϸ��� ����
				String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//�����ͺ��̽��� ����� ���ڵ尪
				UpFile.renameTo(new File(homedir+"/"+refileName));//���� ��¥ ������ ������ ����� �������ϸ����� ���� ���ε�
				
				cm.setC_file(fileDBName);
			}else {
				String fileDBName="";
				cm.setC_file(fileDBName);
			}//if else
			
			 cm.setC_id(c_id); cm.setC_title(c_title); cm.setC_cont(c_cont);
			
			this.communityService.insertCm(cm);
			
			return new ModelAndView("redirect:/community_list?page="+page);
			}
			return null;
	}
	@RequestMapping("community_cont")
	public String community_cont(int c_no,int page,String state,Model m,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = (String)session.getAttribute("id");
		CommunityVO cm=new CommunityVO();
		
		if(id == null) {
			out.println("<script>");
			out.println("alert('�ٽ� �α��� ���ּ���');");
			out.println("location='member_login';");
			out.println("</script>");
		
		}else {
			page = 1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			if(state.equals("cont")) {
				this.communityService.updateHit(c_no);
			}
			cm=this.communityService.getCCont(c_no);
			String c_cont=cm.getC_cont().replace("\n","<br>");
			
			
			m.addAttribute("cm",cm);
			m.addAttribute("c_cont",c_cont);
			m.addAttribute("page",page);
			
			if(state.equals("cont")) {
				return "community/community_cont";
			}else if(state.equals("edit")) {
				return "community/community_edit";			
			}
		}
		return null;
	}
	@PostMapping("community_edit_ok")
	public ModelAndView community_edit_ok(CommunityVO cm,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id=(String)session.getAttribute("id");
		if(id == null) {
			out.println("<script>");
			out.println("alert('�ٽ� �α��� ���ּ���');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
			String saveFolder=request.getRealPath("resources/upload");
			
			int fileSize = 200*1024*1024;
			MultipartRequest multi = null;
			
			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
			
			int c_no = Integer.parseInt(multi.getParameter("c_no"));
			int page=1;
			if(multi.getParameter("page")!=null) {
				page=Integer.parseInt(multi.getParameter("page"));
			}
			String c_id = multi.getParameter("c_id");
			String c_title = multi.getParameter("c_title");
			String c_cont = multi.getParameter("c_cont");
			
			CommunityVO db_file=this.communityService.getCCont(c_no);
			
			File UpFile=multi.getFile("c_file");
			
			if(UpFile != null) {
				String fileName = UpFile.getName();
				File delFile=new File(saveFolder+db_file.getC_file());
				if(delFile.exists()) {
					delFile.delete();
				}
				
				Calendar c=Calendar.getInstance();
				int year=c.get(Calendar.YEAR);
				int month=c.get(Calendar.MONTH);
				int date=c.get(Calendar.DATE);
				
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
				File path=new File(homedir);
				
				if(!(path.exists())) {
					path.mkdir();
				}
				
				Random r =new Random();
				int random=r.nextInt(100000000);
				
				int index = fileName.lastIndexOf("."); 
				//÷�ε� ���ϸ��� ��ħȿ�� �ǿ����ʺ��� ã�Ƽ� ���� ���� ������ ��ħǥ ��ġ��ȣ�� �� ���ʿ��� ���� ���(0���� ����) ��ġ��ȣ���� ����
				
				String fileExtendsion=fileName.substring(index+1);//��ħǥ ���ĺ��� ������ ���ڱ��� ����. �� ÷�ε� ���ϸ��� Ȯ���ڸ� ���ؼ� ����
				String refileName="c"+year+month+date+random+"."+fileExtendsion; //���ο� �������ϸ��� ����
				String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//�����ͺ��̽��� ����� ���ڵ尪
				UpFile.renameTo(new File(homedir+"/"+refileName));//���� ��¥ ������ ������ ����� �������ϸ����� ���� ���ε�
				
				cm.setC_file(fileDBName);
			}else {
				String fileDBName="";
				if(db_file.getC_file() != null) {
					cm.setC_file(db_file.getC_file());
				}else {
					cm.setC_file(fileDBName);
				}
			}//if else
			
			cm.setC_no(c_no); cm.setC_id(c_id); cm.setC_title(c_title); cm.setC_cont(c_cont);
			
			this.communityService.editCm(cm);
			ModelAndView m=new ModelAndView("redirect:/community_list?page="+page);
			m.addObject("page",page);

			return m;
			
		}
		return null;
	}
	@RequestMapping("community_del")
	public String community_del(CommunityVO cm,int c_no,int page,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id=(String)session.getAttribute("id");
		if(id == null) {
			out.println("<script>");
			out.println("alert('�ٽ� �α��� ���ּ���');");
			out.println("location='member_login';");
			out.println("</script>");
		}else {
		String up=request.getRealPath("resources/upload");
		CommunityVO db_file=this.communityService.getCCont(c_no);
		this.communityService.delCm(c_no);
		
		if(db_file.getC_file() != null) {
			File delFile=new File(up+db_file.getC_file());
			delFile.delete();
		}
		return "redirect:/community_list?page="+page;
		}
		return null;
	}
}

