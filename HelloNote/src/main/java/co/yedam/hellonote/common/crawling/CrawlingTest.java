package co.yedam.hellonote.common.crawling;

import java.io.IOException;
import java.net.URLEncoder;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CrawlingTest {
	public static void main(String[] args) throws IOException {
		String siteId = "6868389";

		Document doc = Jsoup.connect("http://www.10000recipe.com/recipe/" + siteId).userAgent(
				"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36")
				.get();
		Document doc1 = Jsoup.connect("https://www.10000recipe.com/recipe/" + siteId).get();
//		Coonection.Response response = Jsoup.connect("http://www.10000recipe.com/recipe/" + siteId).method(")
		Elements elem = doc.select(".view2_step_cont");
		Elements elem1 = doc.select(".weighing_modal");
		System.out.println(doc1);
	}
}
