import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/View/NewsListItem.dart';
import '../Api/ApiManager.dart';
import 'SourceResponse.dart';


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
    newsFuture = (searchQuery=="") ? loadNewsFromHome(widget.source,this.searchQuery) :
        loadNewsFromCategory(widget.source,this.searchQuery);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsFuture  ,
        builder: (context,snapshot){
          if(snapshot.hasData) {
            return ListView.builder(itemBuilder: (buildContext, index) {
              return NewsListItem(snapshot.data!.articles[index]
              );
            }, itemCount: snapshot.data!.articles.length,
            );
          }
          else if(snapshot.hasError){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myText("Connection timeout"),
                  myText("Please try again"),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.refresh,
                        size: 40,
                        color: Colors.blueGrey,
                      ),
                      onPressed: (){
                        refreshData();
                        CircularProgressIndicator();
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator());
        }
      ),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 25,
        color: Colors.blueGrey,
      ),
    );
  }

  Future refreshData() async {
    await Future.delayed(Duration(milliseconds: 1));
    newsFuture = (searchQuery=="") ? loadNewsFromHome(widget.source,this.searchQuery) :
    loadNewsFromCategory(widget.source,this.searchQuery);
    setState(() {});
  }
}
