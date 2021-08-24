import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/HomeScreenSearch.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/View/NewsListItem.dart';
import 'Api/ApiManager.dart';
import 'Model/SourceResponse.dart';

class NewsFragment extends StatefulWidget {
  final Source source;
  late String searchQuery;

  NewsFragment(this.source,this.searchQuery);

  @override
  _NewsFragmentState createState() => _NewsFragmentState(this.searchQuery);
}

class _NewsFragmentState extends State<NewsFragment> {
  late Future <NewsResponse> newsFuture;
  late String searchQuery;

  _NewsFragmentState(this.searchQuery);

  @override
  void initState() {
    super.initState();
    newsFuture = (searchQuery=="") ? loadNewsfromHome(widget.source,this.searchQuery) :
        loadNewsfromCategory(widget.source,this.searchQuery);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsFuture  ,
        builder: (context,snapshot){
          if(snapshot.hasData) {
            return ListView.builder(itemBuilder: (buildContext, index) {
              return NewsListItem(snapshot.data!.articles[index]);
            }, itemCount: snapshot.data!.articles.length,
            );
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
