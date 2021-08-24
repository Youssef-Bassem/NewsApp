import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsItem.dart';

import 'HomeScreenSearch.dart';

class FullScreenNews extends StatelessWidget {

  NewsItem news;
  FullScreenNews(this.news);

  @override
  Widget build(BuildContext context) {
    DateTime time1 = DateTime.parse(news.publishedAt);
    String Timeago = convertToAgo(time1);

    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80),
            )
        ),
        //title: Text('$Category'),
        backgroundColor: HomeScreenSearch.color,
        centerTitle: true,
        title: Text(news.source.name),
      ),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/pattern.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),

              Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Image.network(news.urlToImage.toString()),
                    SizedBox(height: 8,),
                    Container(alignment: Alignment.centerLeft,
                        child:Text(news.source.name,style:TextStyle(fontSize: 14,color: Colors.grey))
                    ),
                    SizedBox(height: 5,),
                    Text(news.title,maxLines: 4,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(alignment: Alignment.centerRight,
                        child:Text('$Timeago',style:TextStyle(fontSize: 14,color: Colors.grey))
                    ),
                    SizedBox(height: 30,),
                    Container(
                      color: Colors.white,
                      child: Text(news.description,style: TextStyle(fontSize: 14),maxLines: 1000,),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      color: Colors.white,
                      child: Text(news.content,style: TextStyle(fontSize: 14),maxLines: 1000,),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String convertToAgo(DateTime input){
    Duration diff = DateTime.now().difference(input);

    if(diff.inDays >= 1){
      return '${diff.inDays} days ago';
    } else if(diff.inHours >= 1){
      return '${diff.inHours} hours ago';
    } else if(diff.inMinutes >= 1){
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inSeconds >= 1){
      return '${diff.inSeconds} seconds ago';
    } else {
      return 'just now';
    }
  }

}