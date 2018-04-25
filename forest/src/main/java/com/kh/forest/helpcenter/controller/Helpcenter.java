package com.kh.forest.helpcenter.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forest.common.Member;
import com.kh.forest.helpcenter.model.exception.HelpException;
import com.kh.forest.helpcenter.model.service.HelpService;
import com.kh.forest.helpcenter.model.service.sha512;
import com.kh.forest.helpcenter.model.vo.Commentary;
import com.kh.forest.helpcenter.model.vo.Notice;
import com.kh.forest.helpcenter.model.vo.PageInfo;
import com.kh.forest.helpcenter.model.vo.SearchCondition;

@Controller
public class helpCenter {

	@Autowired
	private HelpService hs;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private sha512 sha512;

	// 사용장 정의 예외 2

	// AOP 처리만 하면 됨 ( )

	// 1 메인 로딩 (get) (매개변수 x) // 헬프센터 메인은 디비에서 가져올 것 없음. 완료
	// 세션에 정보 저장
	@RequestMapping(value = "helpCenter.help", method = RequestMethod.GET)
	public ModelAndView helpCenter(ModelAndView mv, Member loginUser, HttpSession session) {
		try {

			String USER_ID = "admin";
			String USER_PWD = "admin";
			int USER_NO = 1;

			loginUser.setmNo(USER_NO);
			loginUser.setmId(USER_ID);
			loginUser.setmPwd(USER_PWD);

			session.setAttribute("loginUser", loginUser);
			mv.setViewName("/helpCenter");

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mv;
	}

	// 2 문의 등록 버튼 클릭(get) // 여기도 디비에서 가져올 것 없음. 완료
	@RequestMapping(value = "RegisterHelp.help", method = RequestMethod.GET)
	public ModelAndView RegisterHelp(ModelAndView mv) {

		try {
			mv.setViewName("/RegisterHelp");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 사용장 정의 예외 2

	// 3 문의 등록 폼 제출 & 리다이렉트하여 문의 등록 리스트 호출(post) // 인서트와 셀렉트 따로
	@RequestMapping(value = "PersonalInquiryList.help", method = RequestMethod.POST)
	public String PersonalInquiryList(String NOTICE_TITLE, String NOTICE_CONTENT, String NOTICE_PWD,
			HttpSession session, Notice notice) {

		String USER_NO = "1";

		try {

			notice.setUSER_NO(USER_NO);

			notice.setNOTICE_PWD(sha512.encryptSHA512(NOTICE_PWD));

			notice.setNOTICE_TITLE(NOTICE_TITLE);
			notice.setNOTICE_CONTENT(NOTICE_CONTENT);

			int result = hs.insertHelp(notice);

			// 리다이렉트를 쓰면 되니까 한번에 한 동작씩만 하게 하면 됨.

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:InquiryList.help";

	}

	// 사용장 정의 예외1

	// 4 메인 검색 (post) 완료
	@RequestMapping(value = "HelpCenterSearch.help", method = RequestMethod.POST)
	public ModelAndView HelpCenterSearch(ModelAndView mv, String searchCondition, String searchContent, Notice notice,
			HttpServletRequest request) {

		try {

			// 객체 클래스 활용해서 여기에 검색한 값 저장 후 전송
			SearchCondition sc = new SearchCondition();

			// 제목(title)으로 검색할 수도
			// 내용(content)으로 검색할 수도

			// 객체에 저장
			if (searchCondition.equals("title")) {
				sc.setTitle(searchContent);
			}
			if (searchCondition.equals("content")) {
				sc.setContent(searchContent);
			}

			// 페이징 부분 변수 선언
			int currentPage;
			int limit;
			int maxPage;
			int startPage;
			int endPage;

			// 초기값 대입
			currentPage = 1;
			limit = 10;

			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			int listCount;

			// 검색 선택 조건 객체를 매개변수로
			// count를 리턴받아야함
			listCount = hs.getHelpSearchResultListCount(sc);
			maxPage = (int) ((double) listCount / limit + 0.9);
			startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
			endPage = startPage + limit - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// pageInfo 객체에 페이징에 필요한 변수들 다 저장.

			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			ArrayList<Notice> list = hs.searchHelpResultList(sc, pi);

			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/HelpCenterSearch");

		} catch (HelpException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("/errorPage");

		}
		return mv;
	}

	// 6 문의 등록 상세 페이지에서 댓글(post) (ajax)
	@RequestMapping(value = "Reply.help", method = RequestMethod.POST)
	public void ReplyHelp(ModelAndView mv, String ReplyHelp, String notice_no, Commentary reply,
			HttpServletResponse response) {

		// 맵형식
		ObjectMapper mapper = new ObjectMapper();

		String user_no = "1";

		try {
			reply.setComment_content(ReplyHelp);
			reply.setNotice_no(notice_no);
			reply.setUser_no(user_no);

			ArrayList<Commentary> replyList = hs.insertCommentary(reply);

			// 한글 깨짐 방지
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(replyList));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 7 일반 문의 완료
	@RequestMapping(value = "GeneralFAQ.help", method = RequestMethod.GET)
	public ModelAndView GeneralFAQ(ModelAndView mv) {

		try {
			mv.setViewName("/GeneralFAQ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 8 작가문의 완료
	@RequestMapping(value = "AuthorFAQ.help", method = RequestMethod.GET)
	public ModelAndView AuthorFAQ(ModelAndView mv) {

		try {
			mv.setViewName("/AuthorFAQ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 9 독자문의 완료
	@RequestMapping(value = "ReaderFAQ.help", method = RequestMethod.GET)
	public ModelAndView ReaderFAQ(ModelAndView mv) {

		try {
			mv.setViewName("/ReaderFAQ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 사용장 정의 예외 2

	// 10 문의 등록 리스트에서 상세 페이지 (get) select로 조회 완료
	@RequestMapping(value = "InquiryDetail.help", method = RequestMethod.GET)
	public ModelAndView InquiryDetail(ModelAndView mv, String NOTICE_NO, Notice notice) {

		try {
			notice.setNOTICE_NO(NOTICE_NO);
			ArrayList<Notice> list = hs.helpDetailSelectList(notice);

			mv.addObject("list", list);
			mv.setViewName("/InquiryDetail");

		} catch (HelpException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("/errorPage");
		}
		return mv;

	}

	// 10 암호 모달 암호 입력시 (post 인데 SELECT ONE으로 조회) //
	// 암호 일치 x면 암호가 일치하지 않습니다 alert 뜨고 다시

	@RequestMapping(value = "comparePassword.help", method = RequestMethod.POST)
	public void comparePassword(ModelAndView mv, String NOTICE_PWD, String NOTICE_NO, Notice notice,
			HttpServletResponse response) {

		try {

			sha512 sha512 = new sha512();

			String encodePwd = sha512.encryptSHA512(NOTICE_PWD);

			notice.setNOTICE_PWD(encodePwd);
			notice.setNOTICE_NO(NOTICE_NO);
			notice = hs.comparePassword(notice);

			String passwordCheck = notice.getNOTICE_CONTENT();

			if (notice != null) {
				String check = "암호가 맞습니다.";
				ObjectMapper mapper = new ObjectMapper();
				response.getWriter().print(mapper.writeValueAsString(passwordCheck));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 11 UPDATE 전 조회

	@RequestMapping(value = "updateDetailSelect.help", method = RequestMethod.GET)
	public ModelAndView UpdateDetailSelectList(ModelAndView mv, String NOTICE_NO, Notice notice) {

		try {
			notice.setNOTICE_NO(NOTICE_NO);

			System.out.println(NOTICE_NO);

			ArrayList<Notice> list = hs.updateDetailSelectList(notice);

			mv.addObject("list", list);
			mv.setViewName("/updateDetail");

		} catch (HelpException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("/errorPage");
		}
		return mv;

	}

	// 12 UPDATE
	@RequestMapping(value = "updateDetailComplete.help", method = RequestMethod.POST)
	public String UpdateDetailComplete(ModelAndView mv, String content, String notice_no, Notice notice) {

		try {
			System.out.println(notice_no);
			System.out.println(content);
			notice.setNOTICE_NO(notice_no);
			notice.setNOTICE_CONTENT(content);

			int result = hs.updateDetailComplete(notice);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:InquiryDetail.help?NOTICE_NO=" + notice_no;

	}

	// 13 삭제
	@RequestMapping(value = "deleteDetail.help", method = RequestMethod.GET)
	public String deleteDetail(ModelAndView mv, String NOTICE_NO, Notice notice) {

		try {
			notice.setNOTICE_NO(NOTICE_NO);
			System.out.println(NOTICE_NO);

			int result = hs.deleteDetail(notice);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:InquiryList.help";

	}
 

	// 15 문의 목록으로 돌아갈 때 // 전체 셀렉트 // 사용장 정의 예외
	@RequestMapping(value = "InquiryList.help", method = RequestMethod.GET)
	public ModelAndView InquiryList(ModelAndView mv, HttpServletRequest request) {

		try {

			// 페이징 부분 변수 선언
			int currentPage;
			int limit;
			int maxPage;
			int startPage;
			int endPage;

			// 초기값 대입
			currentPage = 1;
			limit = 10;

			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			int listCount;

			// 검색 선택 조건 객체를 매개변수로
			// count를 리턴받아야함
			listCount = hs.getHelpListCount();
			maxPage = (int) ((double) listCount / limit + 0.9);
			startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
			endPage = startPage + limit - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// pageInfo 객체에 페이징에 필요한 변수들 다 저장.

			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

			ArrayList<Notice> list = hs.recoverHelpList(pi);
			mv.addObject("list", list);
			mv.addObject("pi", pi);

			mv.setViewName("/PersonalInquiryList");

		} catch (HelpException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("/errorPage");
		}

		return mv;

	}

}
