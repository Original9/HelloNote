package co.yedam.hellonote.common.crawling;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;

public class CrawlingTest {
	public static void main(String[] args) throws IOException {
		Document doc = Jsoup.connect("http://www.10000recipe.com/recipe/6899874").get();

		Elements elem = doc.select(".view2_pic");
		Elements elem1 = doc.select(".view2_summary");
		Elements elem2 = doc.select(".cont_ingre2");
		Element elem3 = doc.select(".view_step").first();

		String stringDoc = elem.toString() + elem1.toString() + elem2.toString() + elem3.toString();
		Document pdoc = Jsoup.parse(stringDoc, "", Parser.xmlParser());
		pdoc.select(".btn_list").remove();
		pdoc.select("#divConfirmedMaterialArea ul li a").remove();
		pdoc.select("script").remove();
		pdoc.select(".view_notice").remove();
		pdoc.select("#recipeIntro span").remove();
		pdoc.select(".user_info2").remove();
		pdoc.select(".best_tit_rmn").remove();
		System.out.println(pdoc.toString());
	}
}
