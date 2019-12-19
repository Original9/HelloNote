package co.yedam.hellonote.common.crawling.recipe;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO {

	@Autowired
	SqlSessionTemplate batis;
	
	public void recipeMenuInsert(RecipeVO vo) {
		batis.insert("RecipeDAO.recipeMenuInsert", vo);
	}
	
}
