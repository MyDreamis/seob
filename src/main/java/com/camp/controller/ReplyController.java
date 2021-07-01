package com.camp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.camp.service.ReplyService;
import com.camp.vo.ReplyVO;

//@ResponseBody를 붙이지 않아도 뷰가 아닌 데이터를 리턴할 수 있다
//하지만 @RestController을 사용할때 리턴값으로 바로 주소를 입력해버리면 그 주소 자체가 화면에 떠버리니 주의!
@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	 private static final Logger logger=
	            LoggerFactory.getLogger(ReplyService.class);
	
	@RequestMapping("reply_list")
	@ResponseBody
	public ModelAndView list(int c_no, ModelAndView mav, ReplyVO r) {
        List<ReplyVO> list =this.replyService.rlist(c_no);
 
        System.out.println("뷰에 전달할 데이터"+list);
        
        mav.addObject("list", list);    //뷰에 전달할 데이터 저장
        
    
        mav.setViewName("community/reply_list");    //뷰의 이름
 
        
        return mav;
		
	}
	   //댓글 목록을 ArrayList로 리턴함
    @RequestMapping("reply_list_json")
    @ResponseBody
    public List<ReplyVO> list_json(int c_no){
        
        return this.replyService.rlist(c_no);
        
    }
	
	@RequestMapping("reply_write")
	@ResponseBody
	private void reply_write(ReplyVO r,@RequestParam int r_no,@RequestParam int c_no,@RequestParam String r_cont,@RequestParam String r_id) throws Exception{
		r.setR_no(r_no);
		r.setC_no(c_no);
		r.setR_cont(r_cont);
		r.setR_id(r_id);
		this.replyService.insertRe(r);

		}
	
	@RequestMapping("reply_update")
	@ResponseBody
	private String reply_update(@RequestParam(value="r_no") int r_no, @RequestParam(value="r_cont") String r_cont,@RequestParam(value="r_id") String r_id,
			 @RequestParam(value="c_no")int c_no, ReplyVO r) throws Exception{
			
	
			r.setR_no(r_no);
			r.setR_cont(r_cont);
			r.setR_id(r_id);
			
			System.out.println("r에 있는 값들 출력함"+r);
			
			 this.replyService.replyUpdate(r);
			 
			return "foward:/community/reply_list";
	}
	
	@RequestMapping("reply_delete/{r_no}")
	@ResponseBody
	private String reply_delete(@RequestParam(value="r_no") int r_no,@RequestParam(value="c_no")int c_no, ReplyVO r) throws Exception{
			
			this.replyService.delete(r_no);
			
			return "foward:/community/reply_list";
	}
	
}
