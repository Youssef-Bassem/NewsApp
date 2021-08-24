import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Api/ApiManager.dart';
import 'package:news_app/View/HomeTabScreen.dart';
import 'HomeScreenSearch.dart';
import '../Model/SourceResponse.dart';

class Search extends StatefulWidget {
  late var Category;
  late String searchQuery;

  Search(this.Category,this.searchQuery);

  @override
  _SearchState createState() => _SearchState(this.Category,this.searchQuery);
}

class _SearchState extends State<Search> {
  late Future<SourceResponse> newsFuture;
  late Source source;
  late var Category;
  late String searchQuery;

  _SearchState(this.Category,this.searchQuery);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = getNewsSources(Category);
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
        title: Text('$Category'),
      ),
/*
      drawer: Container(
        color: Colors.white,
        child: Text('$searchQuery'),
      ),

 */

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
                      return HomeTabs(snapshot.data!.sources,searchQuery); //******
                    }
                    else if(snapshot.hasError){
                      return Text('error loading data'); // assignment e3mel zorar reload
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

}
