package co.yedam.hellonote.mysite.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.mysite.Password.Password;
import co.yedam.hellonote.mysite.dao.MySiteDAO;
import co.yedam.hellonote.mysite.paging.Paging;
import co.yedam.hellonote.mysite.service.MySiteService;
import co.yedam.hellonote.mysite.vo.MySiteSearchVO;
import co.yedam.hellonote.mysite.vo.MySiteVO;

@Service
public class MySiteServiceImpl implements MySiteService {

	@Autowired
	MySiteDAO dao;

	@Override
	public List<Map<String,Object>> getMySiteListMap(MySiteVO vo) {
		vo.setSitePw(Password.decryptSimpleTest(vo.getSitePw()));
		return dao.getMySiteListMap(vo);
	}
	
	// paging 및 암호화 처리
	@Override
	public List<MySiteVO> getMySiteList(MySiteSearchVO svo, Paging paging) {
		// 출력건수
		paging.setPageUnit(15);
		// 페이지번호가 없으면 1로 초기화
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		svo.setStart(paging.getFirst());
		svo.setEnd(paging.getLast());
		// 전체 건수
		paging.setTotalRecord(dao.getMySiteCount(svo));

		List<MySiteVO> list = dao.getMySiteList(svo);

		for (MySiteVO vo : list) {
			vo.setSitePw(Password.decryptSimpleTest(vo.getSitePw()));
		}

		return list;

	}

	@Override
	public int deleteMySite(int[] list, MySiteVO vo) {
		for (int i = 0; i < list.length; i++) {
			vo.setMySiteSeq(list[i]);
			dao.deleteMySite(vo);
		}
		return 0;
	}

	// 암호화
	@Override
	public int insertMySite(MySiteVO vo) {
		vo.setSitePw(Password.encryptSimpleTest(vo.getSitePw()));
		return dao.insertMySite(vo);
	}

	// 암호화
	@Override
	public int updateMySite(MySiteVO vo) {
		vo.setSitePw(Password.encryptSimpleTest(vo.getSitePw()));
		return dao.updateMySite(vo);
	}
	
	// 암호화
	@Override
	public MySiteVO getMySite(MySiteVO vo) {
		MySiteVO result = dao.getMySite(vo); // 암호화된 vo를 result에 담아 
		result.setSitePw(Password.decryptSimpleTest(result.getSitePw())); // result로 decry 복호화 해서 return 해준다
		return result;
	}

	@Override
	public int getMySitedelete(MySiteVO vo) {
		return dao.getMySitedelete(vo);
	}

}
