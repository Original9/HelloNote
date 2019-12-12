package co.yedam.hellonote.widget.service;

import java.util.List;
import java.util.Map;

import co.yedam.hellonote.widget.vo.WidgetVO;

public interface WidgetService {
	
	public List<WidgetVO> getWidgetList(WidgetVO vo);
	public int insertWidget(WidgetVO vo);
	public void deleteWidget(WidgetVO vo);
	public void updateWidget(WidgetVO vo);
	public Map<String, Object> widgetContent(WidgetVO vo);
	public void zIndexUpdate(WidgetVO vo);
}
