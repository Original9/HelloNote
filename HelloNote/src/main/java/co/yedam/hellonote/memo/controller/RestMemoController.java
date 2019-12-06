package co.yedam.hellonote.memo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.memo.service.MemoService;
import co.yedam.hellonote.memo.vo.MemoVO;

@RestController
public class RestMemoController {

	@Autowired
	MemoService service;

	@RequestMapping(value = "insertMemo", method = RequestMethod.POST)
	public int insertMemo(MemoVO vo, HttpSession session) {
		vo.setHellonoteId((String) session.getAttribute("hellonoteId"));
		int a = service.insertMemo(vo);
		return a;
	}

	@RequestMapping("memoSortHandling")
	public void sortHandling(MemoVO vo, HttpSession session) {
		vo.setHellonoteId((String) session.getAttribute("hellonoteId"));
		vo.setMenuId("1");
   
		service.sortHandling1(vo);
		service.sortHandling2(vo);
	}
	
	@RequestMapping("deleteHandling")
	public void deleteHandling(HttpSession session, MemoVO vo) {
		vo.setHellonoteId((String) session.getAttribute("hellonoteId"));
		vo.setMenuId("1");
		
		service.deleteHandling(vo);
		service.deleteMemo(vo);
	}

	@RequestMapping("updateMemo")
	public void updateMemo(HttpSession session, MemoVO vo) {
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
		vo.setMenuId("1");
		
		service.updateMemo(vo);
	}
}
