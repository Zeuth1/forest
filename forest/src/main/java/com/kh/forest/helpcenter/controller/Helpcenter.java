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
public class Helpcenter {

	@Autowired
	private HelpService hs;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private sha512 sha512;

	// �궗�슜�옣 �젙�쓽 �삁�쇅 2

	// AOP 泥섎━留� �븯硫� �맖 ( )

	// 1 硫붿씤 濡쒕뵫 (get) (留ㅺ컻蹂��닔 x) // �뿬�봽�꽱�꽣 硫붿씤�� �뵒鍮꾩뿉�꽌 媛��졇�삱 寃� �뾾�쓬. �셿猷�
	// �꽭�뀡�뿉 �젙蹂� ���옣
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

	// 2 臾몄쓽 �벑濡� 踰꾪듉 �겢由�(get) // �뿬湲곕룄 �뵒鍮꾩뿉�꽌 媛��졇�삱 寃� �뾾�쓬. �셿猷�
	@RequestMapping(value = "RegisterHelp.help", method = RequestMethod.GET)
	public ModelAndView RegisterHelp(ModelAndView mv) {

		try {
			mv.setViewName("/RegisterHelp");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// �궗�슜�옣 �젙�쓽 �삁�쇅 2

	// 3 臾몄쓽 �벑濡� �뤌 �젣異� & 由щ떎�씠�젆�듃�븯�뿬 臾몄쓽 �벑濡� 由ъ뒪�듃 �샇異�(post) // �씤�꽌�듃�� ���젆�듃 �뵲濡�
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

			// 由щ떎�씠�젆�듃瑜� �벐硫� �릺�땲源� �븳踰덉뿉 �븳 �룞�옉�뵫留� �븯寃� �븯硫� �맖.

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:InquiryList.help";

	}

	// �궗�슜�옣 �젙�쓽 �삁�쇅1

	// 4 硫붿씤 寃��깋 (post) �셿猷�
	@RequestMapping(value = "HelpCenterSearch.help", method = RequestMethod.POST)
	public ModelAndView HelpCenterSearch(ModelAndView mv, String searchCondition, String searchContent, Notice notice,
			HttpServletRequest request) {

		try {

			// 媛앹껜 �겢�옒�뒪 �솢�슜�빐�꽌 �뿬湲곗뿉 寃��깋�븳 媛� ���옣 �썑 �쟾�넚
			SearchCondition sc = new SearchCondition();

			// �젣紐�(title)�쑝濡� 寃��깋�븷 �닔�룄
			// �궡�슜(content)�쑝濡� 寃��깋�븷 �닔�룄

			// 媛앹껜�뿉 ���옣
			if (searchCondition.equals("title")) {
				sc.setTitle(searchContent);
			}
			if (searchCondition.equals("content")) {
				sc.setContent(searchContent);
			}

			// �럹�씠吏� 遺�遺� 蹂��닔 �꽑�뼵
			int currentPage;
			int limit;
			int maxPage;
			int startPage;
			int endPage;

			// 珥덇린媛� ���엯
			currentPage = 1;
			limit = 10;

			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			int listCount;

			// 寃��깋 �꽑�깮 議곌굔 媛앹껜瑜� 留ㅺ컻蹂��닔濡�
			// count瑜� 由ы꽩諛쏆븘�빞�븿
			listCount = hs.getHelpSearchResultListCount(sc);
			maxPage = (int) ((double) listCount / limit + 0.9);
			startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
			endPage = startPage + limit - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// pageInfo 媛앹껜�뿉 �럹�씠吏뺤뿉 �븘�슂�븳 蹂��닔�뱾 �떎 ���옣.

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

	// 6 臾몄쓽 �벑濡� �긽�꽭 �럹�씠吏��뿉�꽌 �뙎湲�(post) (ajax)
	@RequestMapping(value = "Reply.help", method = RequestMethod.POST)
	public void ReplyHelp(ModelAndView mv, String ReplyHelp, String notice_no, Commentary reply,
			HttpServletResponse response) {

		// 留듯삎�떇
		ObjectMapper mapper = new ObjectMapper();

		String user_no = "1";

		try {
			reply.setComment_content(ReplyHelp);
			reply.setNotice_no(notice_no);
			reply.setUser_no(user_no);

			ArrayList<Commentary> replyList = hs.insertCommentary(reply);

			// �븳湲� 源⑥쭚 諛⑹�
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(replyList));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 7 �씪諛� 臾몄쓽 �셿猷�
	@RequestMapping(value = "GeneralFAQ.help", method = RequestMethod.GET)
	public ModelAndView GeneralFAQ(ModelAndView mv) {

		try {
			mv.setViewName("/GeneralFAQ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 8 �옉媛�臾몄쓽 �셿猷�
	@RequestMapping(value = "AuthorFAQ.help", method = RequestMethod.GET)
	public ModelAndView AuthorFAQ(ModelAndView mv) {

		try {
			mv.setViewName("/AuthorFAQ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 9 �룆�옄臾몄쓽 �셿猷�
	@RequestMapping(value = "ReaderFAQ.help", method = RequestMethod.GET)
	public ModelAndView ReaderFAQ(ModelAndView mv) {

		try {
			mv.setViewName("/ReaderFAQ");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// �궗�슜�옣 �젙�쓽 �삁�쇅 2

	// 10 臾몄쓽 �벑濡� 由ъ뒪�듃�뿉�꽌 �긽�꽭 �럹�씠吏� (get) select濡� 議고쉶 �셿猷�
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

	// 10 �븫�샇 紐⑤떖 �븫�샇 �엯�젰�떆 (post �씤�뜲 SELECT ONE�쑝濡� 議고쉶) //
	// �븫�샇 �씪移� x硫� �븫�샇媛� �씪移섑븯吏� �븡�뒿�땲�떎 alert �쑉怨� �떎�떆

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
				String check = "�븫�샇媛� 留욎뒿�땲�떎.";
				ObjectMapper mapper = new ObjectMapper();
				response.getWriter().print(mapper.writeValueAsString(passwordCheck));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 11 UPDATE �쟾 議고쉶

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

	// 13 �궘�젣
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
 

	// 15 臾몄쓽 紐⑸줉�쑝濡� �룎�븘媛� �븣 // �쟾泥� ���젆�듃 // �궗�슜�옣 �젙�쓽 �삁�쇅
	@RequestMapping(value = "InquiryList.help", method = RequestMethod.GET)
	public ModelAndView InquiryList(ModelAndView mv, HttpServletRequest request) {

		try {

			// �럹�씠吏� 遺�遺� 蹂��닔 �꽑�뼵
			int currentPage;
			int limit;
			int maxPage;
			int startPage;
			int endPage;

			// 珥덇린媛� ���엯
			currentPage = 1;
			limit = 10;

			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			int listCount;

			// 寃��깋 �꽑�깮 議곌굔 媛앹껜瑜� 留ㅺ컻蹂��닔濡�
			// count瑜� 由ы꽩諛쏆븘�빞�븿
			listCount = hs.getHelpListCount();
			maxPage = (int) ((double) listCount / limit + 0.9);
			startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
			endPage = startPage + limit - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// pageInfo 媛앹껜�뿉 �럹�씠吏뺤뿉 �븘�슂�븳 蹂��닔�뱾 �떎 ���옣.

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
