package co.yedam.hellonote.widget.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.widget.vo.WidgetVO;

@Repository
public class WidgetDAO {

	@Autowired
	SqlSessionTemplate batis;

	public List<WidgetVO> getWidgetList(WidgetVO vo) {
		return batis.selectList("WidgetDAO.getWidgetList", vo);
	}

	public int insertWidget(WidgetVO vo) {
		batis.insert("WidgetDAO.insertWidget", vo);
		return vo.getWidgetsSeq();
	}

	public void deleteWidget(WidgetVO vo) {
		batis.delete("WidgetDAO.deleteWidget", vo);
	}

	public void updateWidget(WidgetVO vo) {
		batis.update("WidgetDAO.updateWidget", vo);
	}

	public List<Map<String, Object>> widgetMemo(WidgetVO vo) {
		return batis.selectList("WidgetDAO.widgetMemo", vo);
	}

	public List<Map<String, Object>> widgetCalendar(WidgetVO vo) {
		return batis.selectList("WidgetDAO.widgetCalendar", vo);
	}

	public List<Map<String, Object>> widgetAccountBook(WidgetVO vo) {
		return batis.selectList("WidgetDAO.widgetAccountBook", vo);
	}

	public List<Map<String, Object>> widgetMySite(WidgetVO vo) {
		return batis.selectList("WidgetDAO.widgetMySite", vo);
	}

	public List<Map<String, Object>> widgetCheckList(WidgetVO vo) {
		return batis.selectList("WidgetDAO.widgetCheckList", vo);
	}

	public void zIndexUpdate(WidgetVO vo) {
		batis.update("WidgetDAO.zIndexUpdate", vo);
	}

	public void zIndexUpdateHandler(WidgetVO vo) {
		batis.update("WidgetDAO.zIndexUpdateHandler", vo);
	}

	public void widgetCheckListUpdate(WidgetVO vo) {
		batis.update("WidgetDAO.widgetCheckListUpdate", vo);
	}
}
