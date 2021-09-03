import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FullScreenNews.dart';
import 'package:news_app/Model/NewsItem.dart';

class NewsListItem extends StatelessWidget {

  NewsItem news;
  NewsListItem(this.news);

  @override
  Widget build(BuildContext context) {
    DateTime time1 = DateTime.parse(news.publishedAt);
    String timeAgo = convertToAgo(time1);

    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FullScreenNews(this.news)),
              );
            },
            child: Image.network(news.urlToImage.toString()),
          ),
          SizedBox(height: 8,),
          Container(alignment: Alignment.centerLeft,
              child:Text(news.source.name,style:TextStyle(fontSize: 14,color: Colors.grey))
          ),
          SizedBox(height: 5,),
          Container(alignment: Alignment.centerLeft,child: Text(news.title,style: TextStyle(fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),
          Text(news.description,maxLines: 4,overflow: TextOverflow.ellipsis,),
          SizedBox(height: 5,),
          Container(alignment: Alignment.centerRight,
              child:Text('$timeAgo',style:TextStyle(fontSize: 14,color: Colors.grey))
          ),
          SizedBox(height: 25,),
        ],
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
