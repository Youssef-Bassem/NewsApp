import 'package:news_app/Model/SourceResponse.dart';

class NewsItem {

	Source source;
	String author;
	String title;
	String description;
	String url;
	Object urlToImage;
	String publishedAt;
	String content;

	NewsItem.fromJsonMap(Map<String, dynamic> map):
				source = Source.fromJson(map["source"]),
				author = map["author"]!=null?map["author"]:'',
				title = map["title"]!=null?map["title"]:'',
				description = map["description"]!=null?map["description"]:'',
				url = map["url"]!=null?map["url"]:'',
				urlToImage = map["urlToImage"]!=null?map["urlToImage"]:'',
				publishedAt = map["publishedAt"]!=null?map["publishedAt"]:'',
				content = map["content"]!=null?map["content"]:'';
}