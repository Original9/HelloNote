package co.yedam.hellonote.common.crawling.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	RecipeDAO dao;
	
	@Override
	public void recipeMenuInsert(RecipeVO vo, String[] ingredientList) {
		
		for(String ingredient : ingredientList) {
			System.out.println(ingredient);
			vo.setIngredient(ingredient);
			dao.recipeMenuInsert(vo);
		}
	}

}
