import '../SourceResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<SourceResponse> getNewsSources() async
{
  final uri = Uri.https('newsapi.org', '/v2/top-headlines/sources', {
    'apikey':'1b90d7da7e3e4bfdb95a7e90565e52d3',});
  final response = await http.get(uri);
  print(response.body);
  if( response.statusCode == 200 )
  {
    return SourceResponse.fromJson(jsonDecode(response.body) );
  }
  else
  {
    throw Exception(response.body);
  }
  //newsapi.org
  // v2/everything?q=bitcoin&apiKey=2c099c4f7ddd4a5abc64083e0ec4cc81
}