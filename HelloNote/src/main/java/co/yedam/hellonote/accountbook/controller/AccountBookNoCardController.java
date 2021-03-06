package co.yedam.hellonote.accountbook.controller;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.hellonote.accountbook.service.AccountBookService;
import co.yedam.hellonote.accountbook.vo.AccountBookVO;
import co.yedam.hellonote.bankaccount.service.BankAccountService;
import co.yedam.hellonote.bankaccount.vo.BankAccountVO;

@Controller
public class AccountBookNoCardController {

	@Autowired
	AccountBookService accountBookService;
	
	@Autowired
	BankAccountService bankaccountservice;
	
	@RequestMapping("/accountBookNoCard")
	public String accoutBookList(BankAccountVO bvo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		bvo.setHellonoteId(userDetails.getUsername());
		BankAccountVO bavo = bankaccountservice.selectBankAccount(bvo);
		
		//첫 방문
		if(bavo == null) {
			return "main/menuList/insertCard";
		}
		
		else if(bavo.getBankaccountAccountname() == "none") {
			return "main/menuList/accountBookNoCard";
		}
		
		else {
			return "main/menuList/accountBookNoCard";
		}
		
	}
	// 전체 조회
	@RequestMapping("/getAccountBookListNoCard.json")
	@ResponseBody
	public List<AccountBookVO> getAccountBookList(HttpSession session, AccountBookVO vo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());

		return accountBookService.getAccountBookList(vo);
	}

	// 등록
	@RequestMapping(value = "/insertAccountBookNoCard.json", consumes = "application/json")
	public AccountBookVO insertAccountBook(@RequestBody AccountBookVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		
		accountBookService.insertAccountBook(vo);
		return vo;

	}

	// 삭제
	@RequestMapping("/deleteAccountBookNoCard.json")
	@ResponseBody
	public Map<String, Object> deleteAccountBook(AccountBookVO vo, Model model, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		accountBookService.deleteAccountBook(vo);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;

	}

	// 수정
	@RequestMapping(value = "/updateAccountBookNoCard.json", consumes = "application/json", method = RequestMethod.PUT)
	@ResponseBody
	public AccountBookVO updateAccountbook(@RequestBody AccountBookVO vo, Model model, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		//vo.setMenuId((String)session.getAttribute("menuId"));
		accountBookService.updateAccountBook(vo);
		return vo;
	}

	// 엑셀출력
	@RequestMapping("/downloadExcelNoCard")
	public ModelAndView excelView(AccountBookVO vo) throws IOException {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		List<AccountBookVO> list = accountBookService.getAccountBookList(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] header = { "accountbookSeq", "accountbookDate", "accountbookTranslation", "accountbookPrice",
				"accountbookPurpose"};
		
		map.put("headers", header);
		map.put("filename", "excel_accountBook");
		map.put("datas", convertListToMap(list)); // map 으로 변환해서 값 넘김
		return new ModelAndView("commonExcelView", map);
	}

	// LIST를 HaspMap 형식으로 변경시켜주는 메소드
	public static <T> List<Map<String, Object>> convertListToMap(Collection<T> target) { // T - generic type (어느 타입으로
																							// 받을수 있음)
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		for (T element : target) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Field[] fieldList = element.getClass().getDeclaredFields();
			if (fieldList != null && fieldList.length > 0) {
				try {
					for (int i = 0; i < fieldList.length; i++) {
						String curInsName = fieldList[i].getName();
						Field field = element.getClass().getDeclaredField(curInsName);
						field.setAccessible(true);
						Object targetValue = field.get(element);
						resultMap.put(curInsName, targetValue);
					}
					resultList.add(resultMap);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return resultList;
	}
	
	//구글차트
	@RequestMapping("/chartAccountBookNoCard")
	@ResponseBody
	public List<Map<String, Object>> getChartData(AccountBookVO vo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		List<AccountBookVO> list = accountBookService.chartAccountBook(vo);
		List<Map<String, Object>> list1 = new ArrayList<Map<String, Object>>();
		for (AccountBookVO item : list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("accountbookPurpose", item.getAccountbookPurpose());
			map.put("accountbookPercent", item.getAccountbookPercent());
			list1.add(map);
		}
		return list1;
	}
	
	
	@RequestMapping("/nagetiveChartAccountBookNoCard")
	@ResponseBody
	public List<Map<String, Object>> nagetivegetChartData(AccountBookVO vo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		List<AccountBookVO> list = accountBookService.nagetiveChartAccountBook(vo);
		List<Map<String, Object>> list1 = new ArrayList<Map<String, Object>>();
		for (AccountBookVO item : list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("accountbookPurpose", item.getAccountbookPurpose());
			map.put("accountbookPercent", item.getAccountbookPercent());
			list1.add(map);
		}
		return list1;
	}
	
	
}
