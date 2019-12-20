package co.yedam.hellonote.common.crawling;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.hellonote.common.crawling.recipe.RecipeService;
import co.yedam.hellonote.common.crawling.recipe.RecipeVO;

@Controller
public class CrawlingController {

	@Autowired
	RecipeService recipeService;
	
	@RequestMapping("news")
	public String newsCrawling(Model model) throws IOException {

		Document doc = Jsoup.connect("http://www.itnews.or.kr/").get();
		String elem = doc.select(".td-block-span6").toString();

		model.addAttribute("crawl", elem);

		return "main/main/newsCrawl";
	}

	@RequestMapping("recipe")
	public String recipePage() {
		return "main/main/recipeCrawl";
	}

	@RequestMapping("recipeSearch")
	@ResponseBody
	public Map<String, String> recipeCrawl(@RequestParam String recipeKeyword) throws IOException {
		System.out.println(recipeKeyword);
		String url="http://www.10000recipe.com/recipe/list.html?q=" + recipeKeyword;
		System.out.println(url);
		Document doc = Jsoup.connect(url).get();
		System.out.println(doc);
		doc.select(".thumbnail_over").remove();
		doc.select(".vod_label").remove();
		Element elem = doc.select(".recipe_list").first();
		
		System.out.println(elem);

		return Collections.singletonMap("list", elem.toString());
	}

	@RequestMapping("getRecipe")
	@ResponseBody
	public Map<String, String> getRecipe(@RequestParam String siteId) throws IOException {
		Document doc = Jsoup.connect("http://www.10000recipe.com/recipe/" + siteId).get();
		
		// 필요한 element들만 가져오기
		Elements elem = doc.select(".view2_pic");
		Elements elem1 = doc.select(".view2_summary");
		Elements elem2 = doc.select(".cont_ingre2");
		Element elem3 = doc.select(".view_step").first();
		
		// 가져온 element들 합치기
		String stringDoc = elem.toString() + elem1.toString() + elem2.toString() + elem3.toString();
		
		//가져온 element들을 자를 수 있게 document 타입으로 변환
		Document pdoc = Jsoup.parse(stringDoc, "", Parser.xmlParser());
		
		// 필요 없는 부분들 자르기
		pdoc.select(".btn_list").remove();
		pdoc.select("#divConfirmedMaterialArea ul li a").remove();
		pdoc.select("script").remove();
		pdoc.select(".view_notice").remove();
		pdoc.select("#recipeIntro span").remove();
		pdoc.select(".user_info2").remove();
		pdoc.select(".best_tit_rmn").remove();
		
		return Collections.singletonMap("recipe", pdoc.toString());
	}
	
	@RequestMapping("recipeMenuInsert")
	@ResponseBody
	public void recipeMenuInsert(RecipeVO vo, @RequestParam(value="ingredientList[]", required = false) String[] ingredientList) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		recipeService.recipeMenuInsert(vo, ingredientList);
	}
}
