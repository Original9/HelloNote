package co.yedam.hellonote.widget.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.widget.dao.WidgetDAO;
import co.yedam.hellonote.widget.service.WidgetService;
import co.yedam.hellonote.widget.vo.WidgetVO;

@Service
public class WidgetServiceImpl implements WidgetService{

	@Autowired
	WidgetDAO dao;
	
	@Override
	public List<WidgetVO> getWidgetList(WidgetVO vo) {
		return dao.getWidgetList(vo);
	}

	@Override
	public int insertWidget(WidgetVO vo) {
		return dao.insertWidget(vo);
	}

	@Override
	public void deleteWidget(WidgetVO vo) {
		dao.deleteWidget(vo);
	}

	@Override
	public void updateWidget(WidgetVO vo) {
		dao.updateWidget(vo);
	}

}