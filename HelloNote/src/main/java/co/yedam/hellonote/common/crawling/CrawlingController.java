package co.yedam.hellonote.common.crawling;

import java.io.IOException;
import java.util.Collections;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CrawlingController {

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
		Document doc = Jsoup.connect("http://www.10000recipe.com/recipe/list.html?q=치킨").get();

		doc.select(".thumbnail_over").remove();
		String elem = doc.select(".row").first().toString();

		System.out.println(elem);
		return Collections.singletonMap("list", elem);
	}
}
