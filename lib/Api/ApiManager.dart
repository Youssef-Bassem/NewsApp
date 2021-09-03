import 'dart:async';
import 'package:news_app/Model/NewsResponse.dart';
import '../Model/SourceResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<SourceResponse> getNewsSources(String categoryName) async
{
  final uri = Uri.https('newsapi.org', '/v2/top-headlines/sources', {
    'apikey':'2d9942bc4a254f08a50546195b47fbd8',
    'category':'$categoryName'
  });
  final response = await http.get(uri).timeout(const Duration(seconds: 5),onTimeout: (){
    throw TimeoutException('Connection timeout, please try again');
  });
  if( response.statusCode == 200 )
  {
    return SourceResponse.fromJson(jsonDecode(response.body) );
  }
  else
  {
    throw Exception(response.body);
  }
}

Future<NewsResponse> loadNewsFromHome(Source source,String searchItem) async {
  final uri = Uri.https('newsapi.org', '/v2/everything', {
    'apikey': '2d9942bc4a254f08a50546195b47fbd8',
    'sources': source.id
  });
  final response = await http.get(uri).timeout(const Duration(seconds: 5),onTimeout: (){
    throw TimeoutException('Connection timeout, please try again');
  });
  if(response.statusCode >= 200 && response.statusCode < 300){
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  }
  throw Exception(response.body);
}

Future<NewsResponse> loadNewsFromCategory(Source source,String searchItem) async {
  final uri = Uri.https('newsapi.org', '/v2/everything', {
    'q': '$searchItem',
    'apikey': '2d9942bc4a254f08a50546195b47fbd8',
    'sources': source.id
  });
  final response = await http.get(uri).timeout(const Duration(seconds: 5),onTimeout: (){
    throw TimeoutException('Connection timeout, please try again');
  });
  if(response.statusCode >= 200 && response.statusCode < 300){
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  }
  throw Exception(response.body);
}