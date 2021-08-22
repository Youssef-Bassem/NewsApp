import 'package:flutter/cupertino.dart';
import 'SourceResponse.dart';

class NewsFragment extends StatelessWidget {
  final Source source;
  NewsFragment(this.source);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  Future loadNews(){
    final uri = Uri.https('newsapi.org', '/v2/everything', {
      'apikey':'1b90d7da7e3e4bfdb95a7e90565e52d3',
      'sources': source.id
    });
  }
}
