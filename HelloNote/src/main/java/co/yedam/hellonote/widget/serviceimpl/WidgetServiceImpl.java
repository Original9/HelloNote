package co.yedam.hellonote.widget.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.widget.dao.WidgetDAO;
import co.yedam.hellonote.widget.service.WidgetService;
import co.yedam.hellonote.widget.vo.WidgetVO;

@Service
public class WidgetServiceImpl implements WidgetService {

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

	@Override
	public List<Map<String, Object>> widgetContent(WidgetVO vo) {
		switch (vo.getMenuTypeNumber()) {
		case 1:
			return dao.widgetCalendar(vo);
		case 2:
			return dao.widgetMemo(vo);
		case 4:
			System.out.println("this is account book");
			System.out.println(vo.getMenuTypeNumber());
			System.out.println(vo.getMenuId());
			System.out.println(vo.getHellonoteId());
			
			return dao.widgetAccountBook(vo);
		case 3:
			return null;
		}

		return null;
	}

	@Override
	public void zIndexUpdate(WidgetVO vo) {
		dao.zIndexUpdate(vo);
		dao.zIndexUpdateHandler(vo);
	}

}
