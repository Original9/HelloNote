package co.yedam.hellonote.user.controller;

import java.io.IOException;
import java.text.Normalizer;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import co.yedam.hellonote.user.service.UserService;
import co.yedam.hellonote.user.vo.UserVO;
import freemarker.core.ParseException;

@Controller
public class UserController {

	// NaverLoginVO
	private String apiResult = null;

	@Autowired
	UserService userService;

	// 1. 첫 로그인 페이지 (홈페이지 열자마자 보이는 화면)
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Locale locale, Model model, HttpSession session) {
		// 네이버 아이디로 인증 URL을 생성하기 위하여 UserVO클래스의 getAuthorizationUrl메소드 호출
		UserVO vo = new UserVO();
		String naverAuthUrl = vo.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@11111111111" + naverAuthUrl);
		return "layout/login";
	}

	// 2. 네이버 아이디로 로그인 성공 시에 돌아올 페이지
	@RequestMapping(value = "/Mainpage/Callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22222222222");
		UserVO vo = new UserVO();
		OAuth2AccessToken oauthToken;
		oauthToken = vo.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = vo.getUserProfile(oauthToken); // String형식의 json데이터
		System.out.println("여기는 콜백의 apiResult::: " + apiResult);
		// "id":"76298500","age":"20-29","gender":"F","email":"je708@naver.com","name":"\ubc15\uc9c0\uc6d0","birthday":"04-10"

//		// 2. String형식인 apiResult를 json 형태로 바꿈
//		JSONParser parser = new JSONParser();
//		Object obj = null;
//		try {
//			obj = parser.parse(apiResult);
//		} catch (org.json.simple.parser.ParseException e) {
//			e.printStackTrace();
//		}
//		JSONObject jsonObj = (JSONObject) obj;
//
//		// 3. 데이터 파싱 후 vo에 set
//		JSONObject response_obj = (JSONObject) jsonObj.get("response");
//
//		String strangeName = (String) response_obj.get("name"); // 유니코드 이름
//		String normalName = Normalizer.normalize(strangeName, Normalizer.Form.NFC); // 유니코드를 한글로 변환

		// insert 후에 조회를 해서 다시 가져오지 않기 때문에 여기서 값을 넣은 후 밑에서 세션에 저장을 해야 다른 페이지에서 세션 값으로 쓸
		// 수 있음
//		vo.setHellonoteId("hellonoteId");
//		vo.setPw("pw");
//		vo.setGender("gender");
//		vo.setAge("age");
//		vo.sethProfile("hProfile");
//		vo.sethGrant("hGrant");
//
//		// 4. 파싱한 정보가 DB에 있는지 확인하고 없으면 DB에 insert -> 계정 상태까지 체크하고 리턴
//		userService.insertUserSignUp(vo);

		// 5. security에 setContext으로 값을 담아줌
		SecurityContextHolder.getContext()
				.setAuthentication(new UsernamePasswordAuthenticationToken(vo, null, vo.getAuthorities()));

		return "/HelloNote/Mainpage";
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

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String homelogin(Locale locale, Model model) {
//
//		return "layout/login";
//	}

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
}
