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
		return batis.insert("WidgetDAO.insertWidget", vo);
	}

	public void deleteWidget(WidgetVO vo) {
		batis.delete("WidgetDAO.deleteWidget", vo);
	}
	
	public void updateWidget(WidgetVO vo) {
		batis.update("WidgetDAO.updateWidget", vo);
	}
	
	public Map<String, Object> widgetMemo(WidgetVO vo){
		return batis.selectOne("WidgetDAO.widgetMemo", vo);
	}
	
	public void zIndexUpdate(WidgetVO vo) {
		batis.update("WidgetDAO.zIndexUpdate", vo);
	}
	
	public void zIndexUpdateHandler(WidgetVO vo) {
		batis.update("WidgetDAO.zIndexUpdateHandler", vo);
	}
}
