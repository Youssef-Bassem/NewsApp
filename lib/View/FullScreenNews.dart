import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsItem.dart';
import 'package:url_launcher/url_launcher.dart';
import 'HomeScreenSearch.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FullScreenNews extends StatefulWidget {

  NewsItem news;
  FullScreenNews(this.news);

  @override
  _FullScreenNewsState createState() => _FullScreenNewsState();
}

class _FullScreenNewsState extends State<FullScreenNews> {
  @override
  Widget build(BuildContext context) {
    DateTime time1 = DateTime.parse(widget.news.publishedAt);
    String timeAgo = convertToAgo(time1);

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
        title: Text(widget.news.source.name),
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
                    CachedNetworkImage(
                      imageUrl: widget.news.urlToImage.toString(),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(height: 8,),
                    Container(alignment: Alignment.centerLeft,
                        child:Text(widget.news.source.name,style:TextStyle(fontSize: 14,color: Colors.grey))
                    ),
                    SizedBox(height: 5,),
                    Text(widget.news.title,maxLines: 4,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(alignment: Alignment.centerRight,
                        child:Text('$timeAgo',style:TextStyle(fontSize: 14,color: Colors.grey))
                    ),
                    SizedBox(height: 30,),
                    Container(
                      color: Colors.white,
                      child: Text(widget.news.description,style: TextStyle(fontSize: 14),maxLines: 1000,),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      color: Colors.white,
                      child: Text(widget.news.content,style: TextStyle(fontSize: 14),maxLines: 1000,),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                  _launchUrl();
                              },
                              child: Text(
                                'View Full Article',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )
                          ),
                          Icon(Icons.play_arrow)
                        ],
                      ),
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

  _launchUrl() async
  {
    var urllaunchable = await canLaunch(widget.news.url);
    if(urllaunchable)
    {
      await launch(widget.news.url);
    }
    else
    {
      print("URL can't be launched.");
    }
  }

}