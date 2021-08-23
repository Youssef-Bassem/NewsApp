import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsItem.dart';

import 'HomeScreenSearch.dart';

class FullScreenNews extends StatelessWidget {

  NewsItem news;
  FullScreenNews(this.news);

  @override
  Widget build(BuildContext context) {
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
        title: Text(news.title),
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
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Image.network(news.urlToImage.toString()),
                    SizedBox(height: 8,),
                    Text(news.description,maxLines: 4,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
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
}