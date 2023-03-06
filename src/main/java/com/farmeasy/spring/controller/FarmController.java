package com.farmeasy.spring.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmeasy.spring.dao.FarmMemberVO;
import com.farmeasy.spring.dao.FarmCommentVo;
import com.farmeasy.spring.dao.FarmVO;
import com.farmeasy.spring.service.BCommentInsertServiceInter;
import com.farmeasy.spring.service.BCommentListServiceInter;
import com.farmeasy.spring.service.BContentServiceInter;
import com.farmeasy.spring.service.BDeleteServiceInter;
import com.farmeasy.spring.service.BInsertTestServiceInter;
import com.farmeasy.spring.service.BListServiceInter;
import com.farmeasy.spring.service.BUpdateServiceInter;
import com.farmeasy.spring.service.BUpdateViewServiceInter;
import com.farmeasy.spring.service.BWriteServiceInter;
import com.farmeasy.spring.service.InterMemberFindId;
import com.farmeasy.spring.service.InterMemberInt;
import com.farmeasy.spring.service.InterMemberMvo;
import com.farmeasy.spring.service.MemberFindPwInter;
import com.farmeasy.spring.service.MemberService;
import com.farmeasy.spring.service.MemberUpdateInter;
import com.farmeasy.spring.service.MemberUpdatePwInter;




@Controller
public class FarmController {
	
	@Autowired
	@Qualifier("BListService")
	BListServiceInter bListService;
	
//	페이징 처리
//	@Autowired
//	@Qualifier("boardPagingService")
//	 BPagingServiceInter boardPagingService;
	
	@Autowired
	@Qualifier("BContentService")
	BContentServiceInter contentService;
	
	@Autowired
	@Qualifier("BWriteService")
	BWriteServiceInter bWriteService;
	
	@Autowired
	@Qualifier("BInsertTestService")
	BInsertTestServiceInter bInsertTestService;
	
// 	답변
	@Autowired
	@Qualifier("BReplyWriteService")
	BWriteServiceInter bReplyWriteService;
	
	@Autowired
	@Qualifier("BReplyViewService")
	BContentServiceInter bReplyViewService;
	
	@Autowired
	@Qualifier("BCommentInsertService")
	BCommentInsertServiceInter bCommentInsertService;
	
	@Autowired
	@Qualifier("BCommentListService")
	BCommentListServiceInter bCommentListService;
	
	@Autowired
	@Qualifier("BDeleteService")
	BDeleteServiceInter bDeleteService;
	
	@Autowired
	@Qualifier("BUpdateService")
	BUpdateServiceInter bUpdateService;
	
	@Autowired
	@Qualifier("BUpdateViewService")
	BUpdateViewServiceInter bUpdateViewService;
	
	@Autowired
	@Qualifier("memberSignUpService")
	InterMemberMvo memberSignUpService;
	
	@Autowired
	@Qualifier("memberLogin")
	InterMemberInt memberLogin;
	
	@Autowired
	@Qualifier("memberFindId")
	InterMemberFindId memberFindId;
	
	@Autowired
	@Qualifier("memberFindPw")
	MemberFindPwInter memberFindPw;
	
	@Autowired
	@Qualifier("memberUpdatePw")
	MemberUpdatePwInter memberUpdatePw;
	
	@Autowired
	@Qualifier("memberUpdate")
	MemberUpdateInter memberUpdate;
	
	@Autowired
//	@Qualifier("memberService")
	MemberService memberService;
	
	@RequestMapping(value="/idCheck",  method=RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int cnt = memberService.idCheck(id);
		return cnt;
		
	}
	
	
//	@GetMapping(value ="d_board")
	@RequestMapping("/d_board")
	public String list(Model model, String p) {
		System.out.println("d_board()");
		String page_ = p;
		int page = 1;
		if(page_!= null && !page_.equals("")) {
			page = Integer.parseInt(page_);
		}
		bListService.execute(model, page);
		model.addAttribute("page", page);
		System.out.println("1. 페이지 : "+ page);
		
		return "d_board";
	}
	
	@RequestMapping("/content_view")
	public String content_view( @RequestParam(value="bId") int board_id, Model model) {
		System.out.println("d_board_content()");
//		model.addAttribute("content_view" , fvo);
//		System.out.println(fvo.getBoard_content());
		contentService.execute(board_id, model);
		bCommentListService.execute(board_id, model);
		return "d_board_content";
	}
	
//	글쓰기 화면으로 매핑
	@RequestMapping("/d_board_write")
	public String d_board_write() {
		System.out.println("d_board_write");
		return "d_board_write";
	}
	
//	게시판 글쓰기 등록
	@RequestMapping(value="/boardInsert.do", method=RequestMethod.POST)
	public String boardInsert(FarmVO fvo, Model model, HttpSession session) {
		FarmMemberVO mvo = (FarmMemberVO)session.getAttribute("mvo");
		String m_id = mvo.getM_id();
		fvo.setM_id(m_id);
		System.out.println("boardInsert.do()");
		model.addAttribute("fvo", fvo);
		System.out.println(fvo.getBoard_content() + " " + fvo.getM_id());
		bWriteService.execute(fvo);
		return "redirect:/d_board";
	}

//	게시판 글쓰기 등록
	@RequestMapping(value="/insertTest.do")
	public String insertTest() {
		System.out.println("insertTest.do");
		for(int i=0; i<10; i++) {
			bInsertTestService.execute();
		}
		return "redirect:/d_board";
	}
	
//	답변 작성용 jsp
	@RequestMapping(value ="d_reply_write")
	public String replyWrite(int bId, Model model) {
		System.out.println("d_reply_write");
		bReplyViewService.execute(bId, model);
		return "d_reply_write";
	}

//	답변 액션	
	@PostMapping(value ="replyInsert")
	public String replyInsert(FarmVO fvo, Model model, HttpSession session) {
		System.out.println("replyInsert");
		FarmMemberVO mvo = (FarmMemberVO)session.getAttribute("mvo");
		String m_id = mvo.getM_id();
		fvo.setM_id(m_id);
		System.out.println("서비스 가기전 : fvo.getBGroup(): "+ fvo.getBGroup() + 
				"fvo.getBStep(): "+fvo.getBStep() + "fvo.getBIndent(): "+fvo.getBIndent());
		model.addAttribute("fvo", fvo);
		bReplyWriteService.execute(fvo);
		System.out.println("서비스 다녀온 후 : fvo.getBGroup(): "+ fvo.getBGroup() + 
				"fvo.getBStep(): "+fvo.getBStep() + "fvo.getBIndent(): "+fvo.getBIndent());
		return "redirect:/d_board"; //일단 보드로
	}
	
//	답변 글 보기	
	@RequestMapping(value ="d_reply_view")
	public String replyView() {
		System.out.println("d_reply_view");
		return "d_reply_view"; //이거는 매핑 다시 하기
	}

//	댓글 달기	
	@PostMapping(value ="commentInsert.do")
	public String commentInsert(FarmCommentVo commentVo, int bId, Model model,  HttpSession session) {
		System.out.println("replyInsert");
		commentVo.setBoard_id(bId);
		FarmMemberVO mvo = (FarmMemberVO)session.getAttribute("mvo");
		String m_id = mvo.getM_id();
		commentVo.setM_id(m_id);
		System.out.println("m_id"+m_id);
		System.out.println("commentVo.getM_id()"+commentVo.getM_id());
		bCommentInsertService.execute(commentVo);
		return "redirect:content_view?bId="+bId;//이거는 매핑 다시 하기
	}
	
	
//	게시판 삭제
	@RequestMapping("/boardDelete")
	public String boardDelete(int board_id) {
		System.out.println("boardDelete.do()");
		System.out.println(board_id);
		bDeleteService.execute(board_id);
		return "redirect:/d_board";
	}
	
//	게시글 수정 매핑
	@RequestMapping("/d_board_update")
	public String d_board_update(Model model, @RequestParam(value="bId") int board_id) {
		System.out.println("d_board_update()");
		model.addAttribute("board_id", board_id);
		System.out.println(board_id);
		//board_id값 넘겨서 쿼리문 실행
		bUpdateViewService.execute(board_id, model);
		return "d_board_update";
	}
	
//	게시글 수정
	@RequestMapping(value="/boardUpdate.do", method=RequestMethod.POST)
	public String boardUpdate(FarmVO fvo, Model model , @RequestParam(value="board_id") int board_id) {
		System.out.println("boardUpdate.do()");
		fvo.setBoard_id(board_id);
		model.addAttribute("fvo", fvo);
		System.out.println("수정 누르면 : "+ board_id);
		bUpdateService.execute(fvo);
		return "redirect:/content_view?bId="+board_id;
	}
	
	
// Member
	
	@RequestMapping(value="/memberInsert.do", method=RequestMethod.POST)
	public String memberInsert(FarmMemberVO mvo, Model model) {
		System.out.println("memberInsert()");
		model.addAttribute("request", mvo);
		memberSignUpService.execute(mvo);
		return "index";
	}
	
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST)
	public String login(String m_id, String m_pw, HttpSession session, Model model) {
		System.out.println("login()");
		FarmMemberVO mvo = memberLogin.execute(m_id, m_pw);
		if(mvo != null) {
			session.setAttribute("mvo", mvo);
			// 1인 경우 로그인 성공
			System.out.println("로그인 됐나?");
			return "redirect:/index";
		}else{
			// 0인 경우 정보를 다시 입력해라
			System.out.println("Null");
			model.addAttribute("check", 0);
			return "e_loginCheck";
		}
	}
	
	@RequestMapping(value="/memberUpdate.do", method=RequestMethod.POST)
	public String memberUpdate(FarmMemberVO mvo, Model model, int m_seq, HttpSession session) {
		System.out.println("memberUpdate()");
		mvo.setM_seq(m_seq);
		System.out.println(mvo.getM_pw());
		memberUpdate.execute(mvo);
		session.setAttribute("mvo", mvo);
		return "redirect:/f_myPage/"+mvo.getM_seq();
	}

	@RequestMapping(value="/memberFindId.do", method=RequestMethod.POST)
	public String memberFindId(String m_name, String m_email, Model model) {
		System.out.println("login()");
		FarmMemberVO mvo = memberFindId.execute(m_name, m_email);
		if(mvo != null) {
			model.addAttribute("findid", mvo.getM_id());
			// null이 아닌 경우 아이디를 줘야함
			System.out.println(mvo.getM_id());
			return "e_loginCheck";
		}else{
			// 0, -1인 경우 정보를 다시 입력해라
			System.out.println("0, -1인 경우 정보를 다시 입력해라");
			model.addAttribute("findid", 0);
			return "e_loginCheck";
		}
	}
	
	@RequestMapping(value="/memberFindPw.do", method=RequestMethod.POST)
	public String memberFindPw(String m_name, String m_email, String m_id, Model model) {
		System.out.println("memberFindPw()");
		FarmMemberVO mvo = memberFindPw.execute(m_name, m_email, m_id);
		if(mvo != null) {
			model.addAttribute("mvo", mvo);
			// null이 아닌 경우 아이디를 줘야함
			System.out.println(mvo.getM_id());
			return "e_loginFindPw";
		}else{
			// 0, -1인 경우 정보를 다시 입력해라
			System.out.println("null인 경우 정보를 다시 입력해라");
			model.addAttribute("findpw", -1);
			return "e_loginFindPw";
		}
	}
	
	@RequestMapping(value="/updatePw.do", method=RequestMethod.POST)
	public String updatePw(String m_pw, String m_id, String m_email, Model model) {
		System.out.println("updatePw()");
		System.out.println(m_pw + " " + m_id +" "+ m_email);
		memberUpdatePw.execute(m_id, m_pw, m_email);
		return "e_login";
	}
	
	@RequestMapping("/e_logout")
	public String MemberLogout(HttpSession session) {
		System.out.println("MemberLogout()");
		session.invalidate();
		return "index";
	}
	
	
	
	
//	여기서부터 	
//	페이지 매핑
	
//	인덱스 매핑
	@RequestMapping("/index")
	public String index() {
		System.out.println("index()");
		return "index";
	}
	
//  notice 매핑	
	@RequestMapping("/d_notice")
	public String d_notice() {
		System.out.println("d_notice()");
		return "d_notice";
	}

//	회원가입
	@RequestMapping("/e_signup")
	public String e_signup() {
		System.out.println("e_signup()");
		return "e_signup";
	}
	
//	로그인
	@RequestMapping("/e_login")
	public String e_login() {
		System.out.println("e_login()");
		return "e_login";
	}
	
	@RequestMapping("e_find_id")
	public String e_find_id() {
		System.out.println("e_find_id()");
		return "e_find_id";
	}
	
	@RequestMapping("e_find_pw")
	public String e_find_pw() {
		System.out.println("e_find_pw()");
		return "e_find_pw";
	}
	
//  길라잡이	
	@RequestMapping("a_select_step")
	public String a_select_step() {
		System.out.println("a_select_step()");
		return "a_select_step";
	}
	
	@RequestMapping("a_select_chung")
	public String a_select_chung() {
		System.out.println("a_select_chung()");
		return "a_select_chung";
	}
	
	@RequestMapping("a_select_jeolla")
	public String a_select_jeolla() {
		System.out.println("a_select_jeolla()");
		return "a_select_jeolla";
	}
	
	@RequestMapping("a_select_gyeong")
	public String a_select_gyeong() {
		System.out.println("a_select_gyeong()");
		return "a_select_gyeong";
	}
	
	@RequestMapping("/index_check")
	public String index_check() {
		System.out.println("index_check()");
		return "index_check";
	}
	
	@RequestMapping("/index_recommend")
	public String index_recommend() {
		System.out.println("index_recommend()");
		return "index_recommend";
	}
	
	
	
}
