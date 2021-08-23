import 'package:flutter/cupertino.dart';
import 'package:news_app/Model/NewsItem.dart';

class NewsListItem extends StatelessWidget {

  NewsItem news;
  NewsListItem(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(news.urlToImage.toString()),
          Text(news.title,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          Text(news.description,maxLines: 2,overflow: TextOverflow.ellipsis,),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
