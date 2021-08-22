import 'package:news_app/Model/NewsItem.dart';

class NewsResponse {

  String status;
  int totalResults;
  List<NewsItem> articles;

	NewsResponse.fromJsonMap(Map<String, dynamic> map):
		status = map["status"],
		totalResults = map["totalResults"],
		articles = List<NewsItem>.from(map["articles"].map((it) => NewsItem.fromJsonMap(it)));

	// Map<String, dynamic> toJson() {
	// 	final Map<String, dynamic> data = new Map<String, dynamic>();
	// 	data['status'] = status;
	// 	data['totalResults'] = totalResults;
	// 	data['articles'] = articles != null ?
	// 		this.articles.map((v) => v.toJson()).toList()
	// 		: null;
	// 	return data;
	// }
}
