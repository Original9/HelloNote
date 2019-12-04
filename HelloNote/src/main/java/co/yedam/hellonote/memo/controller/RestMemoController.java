package co.yedam.hellonote.memo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
	public int insertMemo(MemoVO vo) {
		int a=service.insertMemo(vo);
		return a;
	}
	
	@RequestMapping(value="memo/{memoSeq}", method=RequestMethod.DELETE)
	public void deleteMemo(@PathVariable int memoSeq, MemoVO vo) {
		vo.setMemoSeq(memoSeq);
		service.deleteMemo(vo);
	}
	
	@RequestMapping("sortHandling")
	public void sortHandling(MemoVO vo, int oldOrder) {
		
	}
	
//	public void updateMemo() {
//		
//	}
}
