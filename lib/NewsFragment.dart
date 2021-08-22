import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'Api/ApiManager.dart';
import 'Model/SourceResponse.dart';

class NewsFragment extends StatefulWidget {
  final Source source;
  NewsFragment(this.source);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  late Future <NewsResponse> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = loadNews(widget.source);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsFuture  ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Text('loaded');
          }
          else if(snapshot.hasError){
            return Text('Error loading news');
          }
          return Center(
            child: CircularProgressIndicator());
        }
      ),
    );
  }
}
