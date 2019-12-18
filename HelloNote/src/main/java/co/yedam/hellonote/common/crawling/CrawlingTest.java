package co.yedam.hellonote.common.crawling;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class CrawlingTest {
	public static void main(String[] args) throws IOException {
		Document doc = Jsoup.connect("http://www.10000recipe.com/recipe/list.html?q=치킨").get();
		
		doc.select(".thumbnail_over").remove();
		Element ele = doc.select(".row").first();
		String elem = doc.select(".row").first().toString();

		System.out.println(elem);
	}
}
