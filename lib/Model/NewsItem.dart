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
		author = map["author"],
		title = map["title"],
		description = map["description"],
		url = map["url"],
		urlToImage = map["urlToImage"],
		publishedAt = map["publishedAt"],
		content = map["content"];

	// Map<String, dynamic> toJson() {
	// 	final Map<String, dynamic> data = new Map<String, dynamic>();
	// 	data['source'] = source == null ? null : source.toJson();
	// 	data['author'] = author;
	// 	data['title'] = title;
	// 	data['description'] = description;
	// 	data['url'] = url;
	// 	data['urlToImage'] = urlToImage;
	// 	data['publishedAt'] = publishedAt;
	// 	data['content'] = content;
	// 	return data;
	// }
}
