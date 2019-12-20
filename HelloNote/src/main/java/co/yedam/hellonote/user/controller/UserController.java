package co.yedam.hellonote.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import co.yedam.hellonote.user.service.NaverService;
import co.yedam.hellonote.user.service.UserService;
import co.yedam.hellonote.user.vo.UserVO;

@Controller
public class UserController {

	// NaverLogin(그냥 NAVER LOGIN 때 쓸 NULL값 변수 선언)
	private String apiResult = null;

	@Autowired
	UserService userService;
	
	@Autowired
	NaverService naverService;

	// 첫 로그인 페이지 (홈페이지 열자마자 보이는 화면)
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Locale locale, Model model, HttpSession session) {
		// 네이버 아이디로 인증 URL을 생성하기 위하여 UserVO클래스의 getAuthorizationUrl메소드 호출
		String naverAuthUrl = naverService.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		return "layout/login";
	}

	// 네이버 아이디로 로그인 성공 시에 돌아올 페이지
	@RequestMapping(value = "/mainPage/Callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request)
			throws IOException, ParseException {
		UserVO vo = new UserVO();
		OAuth2AccessToken oauthToken;
		oauthToken = naverService.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverService.getUserProfile(oauthToken); // String형식의 json데이터
		System.out.println("여기는 콜백의 apiResult::: " + apiResult);
		// "id":"53257059","nickname":"wjds****","profile_image":"프로필이미지주소","age":"20-29","gender":"M","email":"wjdskd06@naver.com","name":"\uc815\uc2b9\ucc2c","birthday":"03-10"}}

		// 2. String 형식인 apiResult를 json 형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top 레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// 파싱할것들
		String range = (String) response_obj.get("age");
		String gender = (String) response_obj.get("gender");
		// String strangeName = (String) response_obj.get("name"); // 유니코드 이름
		// String normalName = Normalizer.normalize(strangeName, Normalizer.Form.NFC);
		// // 유니코드를 한글로 변환

		// 회원가입에 담을 정보 age는 네이버에서 20~29 연령별로 나누기 때문에 특수문자를 자르기위함

		vo.setHellonoteId("N" + (String) response_obj.get("id"));
		vo.sethGrant("U");
		vo.setPw("1234");
		vo.sethProfile("네이버 사용자 입니다. 임시 비밀번호는 1234 입니다. 변경 부탁드립니다.");

		// null 이 아니면 네이버에서 받아온 값 넣어주고 null이면 임의 값 넣는다
		if (gender != null) {
			vo.setGender(gender);
		}
		vo.setGender("M");
		
		if (range != null) {
			vo.setAge(range.substring(0, range.indexOf("-")));
		}
		vo.setAge("20");

		// 후에 회원가입실행 후 알러트로 안내 한 다음 메인페이지로 이동
		int check = userService.insertNaverUserSignUp(vo);
		// 세션 담는다
		SecurityContextHolder.getContext()
				.setAuthentication(new UsernamePasswordAuthenticationToken(vo, null, vo.getAuthorities()));
		System.out.println(check);
		if (1 == check) {
			model.addAttribute("msg", "네이버 이메일로 회원가입이 되셨습니다. 임시비밀번호는 1234 입니다 나중에 프로필에서 변경 부탁드립니다.");
			model.addAttribute("url", request.getContextPath() + "/mainPage"); // getContextPath 앱 이름
			return "layout/naver";
		} else {
			// 회원 가입이 되어있으면 바로 메인페이지 이동
			return "redirect:/mainPage";
		}
	}

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest request) throws Exception {
		String hellonoteId = request.getParameter("hellonoteId");
		UserVO idCheck = userService.idCheck(hellonoteId);
		int result = 0;

		if (idCheck != null) {
			result = 1;
		}
		return result;
	}

	// 회원가입 등록처리 프로시저
	@RequestMapping("insertUserSignUp")
	public String insertUserSignUp(UserVO vo) {
		vo.sethGrant("U");
		userService.insertUserSignUp(vo);
		return "redirect:/";
	}

	// 프로시저 단건삭제
	@RequestMapping("deleteUserProc")
	public String admindeleteUserProc(UserVO vo) {
		userService.deleteUserProc(vo);
		return "redirect:getUserList";
	}

	// 회원 탈퇴
	@RequestMapping("selfDeleteUser")
	public String uesrdeleteuser(UserVO vo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		userService.deleteUserProc(vo);
		SecurityContextHolder.getContext().setAuthentication(null); // 유저 프로시저 삭제 후 세션 값 제거
		return "redirect:/logout";
	}

	// 프로시저 리스트 삭제 처리
	@RequestMapping("deleteUserListProc")
	public String deleteUserListProc(@RequestParam String[] rowCheck, UserVO vo) {
		userService.deleteUserListProc(rowCheck, vo);
		return "redirect:getUserList";
	}

	// 회원 가입 페이지
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {
		return "user/signup";
	}

	// 메인 페이지
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main/main/mainPage";
	}

	// 프로필이동
	@RequestMapping("getProfile")
	public String getProfile(Model model, UserVO vo) {
		model.addAttribute("user", userService.getUserList(vo));
		return "main/user/profile"; // jsp 경로
	}

	// 관리자 페이지 이동
	@RequestMapping(value = { "/admin/*" }, method = RequestMethod.GET)
	public String showIssueList(HttpServletRequest request) {
		// url 값을 받아와서 * 에 넣어줘야 한다.
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		String arrayOfUri[] = path.split("/");
		String x = "main/" + arrayOfUri[1] + "/" + arrayOfUri[2];
		return x;
	}

	// 유저 리스트 페이지(권한 M 만 볼 수 있음)
	@RequestMapping("getUserList")
	public String getUserList(Model model, UserVO vo) {
		model.addAttribute("user", userService.getUserList(vo));
		return "main/user/userlist"; // jsp 경로
	}

	// 삭제 처리
	@RequestMapping("deleteUser")
	public String deleteUser(@RequestParam String[] rowCheck, UserVO vo) {
		userService.deleteUser(rowCheck, vo);
		return "redirect:getUserList";
	}

	// 엑셀출력
	@RequestMapping("downloadExcel1")
	public ModelAndView excelView(UserVO vo) throws IOException {
		List<Map<String, Object>> list = userService.getUserListMap(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] header = { "hellonoteId", "gender", "hGrant", "age", "hProfile" };
		map.put("headers", header);
		map.put("filename", "excel_userlist");
		map.put("datas", list);
		return new ModelAndView("commonExcelView", map);
	}

	// 단건 조회
	@ResponseBody
	@RequestMapping("getUser")
	public UserVO getUser(UserVO vo) {
		return userService.getUser(vo);
	}

	// 단건 삭제
	@RequestMapping("getUserdelete")
	public String getUserdelete(UserVO vo) {
		userService.getUserdelete(vo);
		return "redirect:getUserList";
	}

	// 수정
	@RequestMapping(value = "updateUser", method = RequestMethod.PUT, consumes = "application/json" // 요청헤더
	)
	@ResponseBody // return 값이 java객체를 json 구조로 바꿔준다 @RequestBody는 반대로
	public UserVO updateUser(@RequestBody UserVO vo) {
		userService.updateUser(vo);
		return userService.getUser(vo);
	}

	@RequestMapping(value = "ChangeInfo", method = RequestMethod.PUT, consumes = "application/json" // 요청헤더
	)
	@ResponseBody // return 값이 java객체를 json 구조로 바꿔준다 @RequestBody는 반대로
	public UserVO ChangeInfo(@RequestBody UserVO vo) {
		userService.updateUserChange(vo);
		// 세션에 사용자 정보를 다시 변경
		SecurityContextHolder.getContext()
				.setAuthentication(new UsernamePasswordAuthenticationToken(vo, null, vo.getAuthorities()));
		return userService.getUser(vo);
	}
	@RequestMapping("actImgSubmit")
	public String actImgSubmit(UserVO vo
										,HttpServletRequest request
										,MultipartFile uploadFile
//										,MultipartHttpServletRequest multipartRequest
										) throws IllegalStateException, IOException {
		//업로드 파일 처리 하고 파일명을 vo 에 담기
		String path =request.getSession().getServletContext().getRealPath("/resources/assets/img/user");
//		List<MultipartFile>  uploadFile=multipartRequest.getFiles("uploadFile"); //여러파일 받을때
		
//		logger.debug(path);
		System.out.println(path);
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String beforeImgName = 
		
		System.out.println(uploadFile.getName());
		
//		MultipartFile file= vo.getUploadFile();
		if(!uploadFile.isEmpty() && uploadFile.getSize()>0) {
			
			String originName = uploadFile.getOriginalFilename();
			String ext =originName.substring(originName.lastIndexOf(".")+1,originName.length());
			String fileName=userDetails.getUsername()+"_profileimg."+ext;	
			//String fileName = uploadFile.getOriginalFilename();
			
			uploadFile.transferTo(new File(path,fileName));
			
		}
		
		return "redirect:getProfile";
	}
	
}
