import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Api/ApiManager.dart';
import 'package:news_app/View/HomeTabScreen.dart';
import 'HomeScreenSearch.dart';
import '../Model/SourceResponse.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Search extends StatefulWidget {
  late var category;
  late String searchQuery;

  Search(this.category,this.searchQuery);

  @override
  _SearchState createState() => _SearchState(this.category,this.searchQuery);
}

class _SearchState extends State<Search> {
  late Future<SourceResponse> newsFuture;
  late Source source;
  late var category;
  late String searchQuery;

  _SearchState(this.category,this.searchQuery);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = getNewsSources(category);
  }

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
        title: Text('$category'),
      ),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 15),
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

              FutureBuilder<SourceResponse>(
                  future: newsFuture,
                  builder: (buildContext,snapshot){
                    if(snapshot.hasData){
                      print(snapshot.error);
                      return HomeTabs(snapshot.data!.sources,searchQuery);
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
                                  Center(
                                      child:CircularProgressIndicator(),
                                  );
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
            ],
          ),
        ),
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
    newsFuture = getNewsSources(widget.category);
    setState(() {});
  }
}
