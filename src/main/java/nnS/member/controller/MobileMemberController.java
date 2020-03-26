package nnS.member.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.member.service.JoinService;
import nnS.member.service.LoginService;
import nnS.member.service.MailService;
import nnS.member.service.MyPageService;
import nnS.myshop.service.MyshopService;
import nnS.qna.service.QnaServiceImpl;
import nnS.report.service.ReportServiceImpl;

@Controller
public class MobileMemberController {
   
   Logger log = Logger.getLogger(this.getClass());
      
      @Resource(name="mailService")
      private MailService mailService;
      
      @Resource(name="joinService")
      private JoinService joinService;
      
      @Resource(name = "loginService")
      private LoginService loginService;
      
      @Resource(name="myPageService") 
      private MyPageService myPageService;
      
      @Inject
      private JavaMailSender mailSender;
      
      @Resource(name="qnaService")
  	private QnaServiceImpl qnaService;
      
      @Resource(name="reportService")
  	private ReportServiceImpl reportService;
      
      @Resource(name="myshopService") 
	   private MyshopService myshopService;

      
      /* *******회원가입****** */
      
      @RequestMapping(value = "/memberVerifyM")
      public ModelAndView insertMemberM(HttpServletRequest request, CommandMap commandMap) throws Exception{ //회원가입성공
         ModelAndView mv = new ModelAndView("jsonView");
                         
         System.out.println(commandMap.getMap());
         joinService.insertMember(commandMap.getMap());
         return mv;
      }
      
      @RequestMapping(value = "/join/idCheckM") //아이디 중복확인 모바일
      public ModelAndView idCheckM(CommandMap commandMap) throws Exception {
         ModelAndView mv = new ModelAndView("jsonView");
         
         System.out.println(commandMap.getMap());
         
         String idCheck = String.valueOf(joinService.selectIdCheck(commandMap.getMap()));
         
         System.out.println(idCheck);
         mv.addObject("idCheck",idCheck);
         return mv;
      }
      @RequestMapping(value = "/createEmailAuthM" ,method=RequestMethod.GET)
      public ModelAndView createEmailAuthM(CommandMap commandMap, @RequestParam String userEmail, HttpServletRequest req) throws Exception {
       //이메일 인증
         ModelAndView mv = new ModelAndView("jsonView");
         String message = "";
         String emailCheck = String.valueOf(joinService.selectEmailCheck(commandMap.getMap()));
         if(emailCheck.equals("0")) {
            int ran = new Random().nextInt(900000) + 100000;
            HttpSession session = req.getSession(true);
            String authCode = String.valueOf(ran);
            session.setAttribute("authCode", authCode);
            String subject = "nnS 회원가입 인증 코드 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
            mailService.send(subject, sb.toString(),"gksn9573@gmail.com", userEmail, null);
            message = "사용 가능한 이메일입니다.\n인증번호를 입력해 주세요";
            System.out.println("*****7777****"+session.getAttribute("authCode"));
            mv.addObject("message",message);
            mv.addObject("authCode",authCode);
            return mv;
         }else {
            message = "사용 중인 이메일, 혹은 잘못된 이메일입니다. ";
            mv.addObject("message",message);
            return mv;
         }
      }
      
      
      /* *********로그인******* */
      
      @RequestMapping(value = "/loginM") // 로그인
      public ModelAndView loginM(CommandMap commandMap, HttpServletRequest request) throws Exception {
         ModelAndView mv = new ModelAndView("jsonView");
         
         String message = "";
         String url = "";

         HttpSession session = request.getSession();

         
         Map<String, Object> chk = loginService.loginCheck(commandMap.getMap());
         //Map<String, Object> banChk = adminBanService.banDateCheck(commandMap.getMap());
         if (chk==null) { // 아이디가 있는지 없는지를 확인
            message = "해당 아이디가 존재하지 않습니다.";
         } else {
            if (chk.get("MEM_PW").equals(commandMap.get("MEM_PW"))) {
               session.setAttribute("session_MEM_ID", commandMap.get("MEM_ID"));
               session.setAttribute("session_MEM_INFO", chk);
               
            } else { // 비밀번호가 일치하지 않을 때
               message = "비밀번호가 맞지 않습니다.";
            }
         }
         System.out.println(chk);
         mv.addObject("message",message);
         mv.addObject("url",url);
         mv.addObject("session", session.getAttribute("session_MEM_ID"));
          
         return mv;
    }
   @RequestMapping(value = "/logoutM") // 로그아웃
      public ModelAndView logoutM(HttpServletRequest request, CommandMap commandMap) throws Exception {
         HttpSession session = request.getSession(false);
         if (session != null)
            session.invalidate();
         
         ModelAndView  mv = new ModelAndView("jsonView");
         mv.addObject("message","로그아웃");
         
         return mv;
      }
   
     //아이디 찾기 모바일
     
     @RequestMapping(value = "/findIdM") public ModelAndView
     findIdM(@RequestParam(value = "appType", defaultValue="") String appType,CommandMap commandMap) throws Exception{ 
        ModelAndView mv = new ModelAndView("jsonView"); 
        String id = String.valueOf(loginService.findId(commandMap.getMap())); 
        String message =""; 
        if(id.equals("1")) { 
           String findId = (String)(loginService.findIdWithEmail(commandMap.getMap()).get("MEM_ID"));
           System.out.println(findId); mv.addObject("MEM_ID",findId);
           mv.addObject("message",message);
     }else { 
        message = "입력한 정보의 회원이 없습니다."; mv.addObject("message",message); 
        }
        return mv;
     
     }
    
      
      //비밀번호 찾기 모바일
      @RequestMapping(value = "/findPwResultM", method = RequestMethod.POST) 
         @ResponseBody
         public ModelAndView findPwEmailM(CommandMap commandMap,@RequestParam String MEM_ID, @RequestParam String MEM_EMAIL, HttpServletRequest req) throws Exception {
            ModelAndView mv= new ModelAndView("jsonView");
            String message = "";
            String emailCheck = String.valueOf(loginService.findPwWithEmail(commandMap.getMap()));
            System.out.println(emailCheck);
            if(emailCheck.equals("1")) {
               int ran = new Random().nextInt(900000) + 100000;
                  HttpSession session = req.getSession(true);
                  String authCode = String.valueOf(ran);
                  session.setAttribute("authCode", authCode);
                  session.setAttribute("random", ran);
                  String subject = "nnS 비밀번호 변경 코드 안내 입니다.";
                  StringBuilder sb = new StringBuilder();
                  sb.append("귀하의 임시 비밀번호는 " + authCode + "입니다.");
                  
                  commandMap.put("MEM_ID", MEM_ID);
                  commandMap.put("MEM_EMAIL", MEM_EMAIL);
                  commandMap.put("authCode", authCode);
                  commandMap.put("MEM_PW", ran);
                  loginService.updateTempPw(commandMap.getMap());
                  mailService.send(subject, sb.toString(),"gksn9573@gmail.com", MEM_EMAIL, null);
                  mv.addObject("message","임시 비밀번호 발송");
            }else {
                 mv.addObject("message", "입력된 정보가 올바르지 않습니다.");
            } 
            return mv;
       }
      
      /* *********마이페이지******** */
      
      // 비밀번호 변경 시 현재 비밀번호 입력
       @RequestMapping(value = "/myPageM/pwchangeCheckM", method = RequestMethod.POST)
       public @ResponseBody ModelAndView pwchangeCheck(CommandMap commandMap,HttpServletRequest request) throws Exception {
         //HttpSession session = request.getSession(true);
         //System.out.println(session.getAttribute("session_MEM_INFO"));
         //commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
          ModelAndView mv = new ModelAndView("jsonView");
         String pwCheck = String.valueOf(myPageService.selectPwCheck(commandMap.getMap()));  
         System.out.println(pwCheck);
         mv.addObject("message",pwCheck);
         return mv;
       }
       //비밀번호 변경
      @RequestMapping(value = "/myPageM/pwChageSuccess")
      public ModelAndView pwchange(CommandMap commandMap, @RequestParam String MEM_ID,@RequestParam String MEM_TEMP_PW,HttpServletRequest request) throws Exception {
         ModelAndView mv = new ModelAndView("jsonView");
         HttpSession session = request.getSession();
         commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
         commandMap.put("MEM_ID", MEM_ID);
         commandMap.put("MEM_TEMP_PW", MEM_TEMP_PW);
         myPageService.updatePwModify(commandMap.getMap());   
         mv.addObject("message", "success");
         return mv;
      }
      
      //회원탈퇴시 비밀번호 확인
      @RequestMapping(value = "/myPageM/deletePw")
  		public @ResponseBody ModelAndView deletePw(CommandMap commandMap, HttpServletRequest request) throws Exception {
  			ModelAndView mv = new ModelAndView("jsonView");
  			String pwCheck = String.valueOf(myPageService.selectPwCheck(commandMap.getMap()));  
  			System.out.println(pwCheck);
  			mv.addObject("message",pwCheck);
  			return mv; 
      }	
  	
      //회원탈퇴
  	@RequestMapping(value = "/myPageM/deleteAccountCheck")
  		public ModelAndView deleteAccount(CommandMap commandMap, HttpServletRequest request) throws Exception {
  			ModelAndView mv = new ModelAndView("jsonView");
  			myPageService.deleteAccount(commandMap.getMap());
  			mv.addObject("message","success");
  			return mv;
  		}
  	
  	//내 신고내역(리스트)
  	@RequestMapping(value = {"/myPageM/qnaListPaging"})
	public ModelAndView qnaListPaging(CommandMap commandMap, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> list = qnaService.selectQnaList(commandMap.getMap(), keyword, searchType);
		mv.addObject("list", list);
		return mv;
	}
  	
  	//내 신고내역(리스트)
  	@RequestMapping(value = "/myPageM/reportListPaging")
    public ModelAndView reportListPaging(CommandMap commandMap,@RequestParam(value = "search", defaultValue="") String search, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, HttpServletRequest request) throws Exception {
       ModelAndView mv = new ModelAndView("jsonView");
       List<Map<String,Object>> list = reportService.selectReportList(commandMap.getMap(), search, keyword, searchType);
       mv.addObject("list", list);
       return mv;
    } 
  	
  	/* *****내 상점***** */
    //좋아요목록
    @RequestMapping(value="/myshopM/selectGoodsList")
    public ModelAndView selectGoodsList(CommandMap commandMap, @RequestParam(value = "tstatus", defaultValue="") String tstatus, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, @RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception {
       ModelAndView mv = new ModelAndView("jsonView");
       List<Map<String,Object>> list = myshopService.selectLikeList(commandMap.getMap(), keyword, searchType, sortType, tstatus);
        mv.addObject("list", list);
         if(list.size() > 0){
             mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
         }
         else{
             mv.addObject("TOTAL", 0);
         }
        return mv;
    }
   //내 판매내역
	@RequestMapping(value="/myshopM/selectSaleList")
	public ModelAndView myshopSaleList(CommandMap commandMap, HttpServletRequest request, @RequestParam(value = "tabNo", defaultValue="") String tabNo) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		//HttpSession session = request.getSession();
		//commandMap.put("MEM_ID", session.getAttribute("session_MEM_ID"));
		String filePath_temp = request.getSession().getServletContext().getRealPath("") + "/file/";
		mv.addObject("path", filePath_temp);
		request.setAttribute("path", filePath_temp);
		
		List<Map<String,Object>> list;
		//asdasds
		if(tabNo.equals("1")) {
			list = myshopService.selectMySaleList1(commandMap.getMap());
		}else if(tabNo.equals("2")) {
			list = myshopService.selectMySaleList2(commandMap.getMap());
		}else if(tabNo.equals("3")) {
			list = myshopService.selectMySaleList3(commandMap.getMap());
		}else {
			list = myshopService.selectMySaleList1(commandMap.getMap());
			System.out.println("asdsaasd");
		}
		//asddadsa
		
		mv.addObject("list",list);
		mv.addObject("tabNo", tabNo);
		System.out.println(tabNo);
		
		if(list.size() > 0){  
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		}
		
		return mv;
	}
}