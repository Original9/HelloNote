package co.yedam.hellonote.mysite.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.hellonote.mysite.paging.Paging;
import co.yedam.hellonote.mysite.service.MySiteService;
import co.yedam.hellonote.mysite.vo.MySiteSearchVO;
import co.yedam.hellonote.mysite.vo.MySiteVO;

@Controller
public class MySiteController {

	@Autowired
	MySiteService mySiteService;

	// 목록조회
	@RequestMapping("/mysite")
	public String getMySiteList(Model model, MySiteSearchVO svo, Paging p, HttpServletRequest request,
			HttpSession session) {
		// 세션 값 받아옴 
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		svo.setUserId(userDetails.getUsername());

		// MySite key값
		model.addAttribute("mySite", mySiteService.getMySiteList(svo, p));
		model.addAttribute("paging", p);
		String menuId = request.getParameter("menuId");
		session.setAttribute("menuId", menuId);
		return "main/mysite/mysite"; // jsp 경로
	}

	// 등록 처리
	@RequestMapping("/insertMySite")
	public String insertMySite(MySiteVO vo, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setUserId(userDetails.getUsername());
		mySiteService.insertMySite(vo);
		return "redirect:mysite?menuId=" + vo.getMenuId();
	}

	// 삭제 처리
	@RequestMapping("/deleteMySite")
	public String deleteMySite(@RequestParam int[] rowCheck, MySiteVO vo, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setUserId(userDetails.getUsername());
		mySiteService.deleteMySite(rowCheck, vo);
		return "redirect:mysite?menuId=" + vo.getMenuId();
	}

	// MySiteList 이동
	@RequestMapping(value = { "/mysite/*" }, method = RequestMethod.GET)
	public String showIssueList(HttpServletRequest request) {
		// url 값을 받아와서 * 에 넣어줘야 한다.
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		String arrayOfUri[] = path.split("/");
		String x = "main/" + arrayOfUri[1] + "/" + arrayOfUri[2];
		return x;
	}

	// 단건 조회
	@ResponseBody
	@RequestMapping("/getMySite")
	public MySiteVO getMySite(MySiteVO vo, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setUserId(userDetails.getUsername());
		return mySiteService.getMySite(vo);
	}

	// 단건 삭제
	@RequestMapping("/getMySitedelete")
	public String getMySitedelete(MySiteVO vo, HttpServletRequest request, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setUserId(userDetails.getUsername());
		String menuId = request.getParameter("menuId");
		session.setAttribute("menuId", menuId);
		mySiteService.getMySitedelete(vo);
		return "redirect:mysite?menuId=" + vo.getMenuId();
	}

	// 전체 목록 보기 클릭버튼
	@RequestMapping("/getMySiteListForm")
	public String getMySiteListForm(Model model, MySiteSearchVO svo, Paging p, HttpServletRequest request,
			HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		svo.setUserId(userDetails.getUsername());

		// MySite key값
		model.addAttribute("mySite", mySiteService.getMySiteList(svo, p));
		model.addAttribute("paging", p);
		String menuId = request.getParameter("menuId");
		session.setAttribute("menuId", menuId);
		return "redirect:mysite?menuId=" + svo.getMenuId();
	}

	// 수정
	@RequestMapping(value = "/updateMySite", method = RequestMethod.PUT, consumes = "application/json" // 요청헤더
	)
	@ResponseBody // return 값이 java객체를 json 구조로 바꿔준다 @RequestBody는 반대로
	public MySiteVO updateMySite(@RequestBody MySiteVO vo, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setUserId(userDetails.getUsername());
		mySiteService.updateMySite(vo);
		return mySiteService.getMySite(vo);

	}

	// 엑셀출력
	@RequestMapping("/downloadExcel")
	public ModelAndView excelView(MySiteVO vo, HttpServletRequest request) throws IOException {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setUserId(userDetails.getUsername());
		List<Map<String, Object>> list = mySiteService.getMySiteListMap(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] header = { "siteId", "sitePw", "siteAddr", "siteMemo", "title", "menuId", "mySiteSeq", "siteDate" };
		map.put("headers", header);
		map.put("filename", "excel_mysitelist");
		map.put("datas", list);
		return new ModelAndView("commonExcelView", map);
	}

	// 다운로드
	@RequestMapping("/download/{fileName:.+}")
	public void downloadPDFResource(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("fileName") String fileName) {

		String dataDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/");
		Path file = Paths.get(dataDirectory, fileName);
		if (Files.exists(file)) {
			response.setContentType("application/octet-stream;charset=UTF-8");

			// filename 인코딩
			try {
				setDisposition(fileName, request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				Files.copy(file, response.getOutputStream());
				response.getOutputStream().flush();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}

	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}

	/**
	 * Disposition 지정하기. *
	 * 
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String browser = getBrowser(request);
		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}
		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);
		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}
}
