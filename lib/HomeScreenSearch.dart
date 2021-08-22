import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Api/ApiManager.dart';

import 'SourceResponse.dart';


class HomeScreenSearch extends StatefulWidget {
  static const color = Color(0xFF39A552);

  @override
  _HomeScreenSearchState createState() => _HomeScreenSearchState();
}

class _HomeScreenSearchState extends State<HomeScreenSearch> {
  late Future<SourceResponse> newsFuture;
  late Source source;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = getNewsSources();
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
        title: Text('Home Screen'),
        backgroundColor: HomeScreenSearch.color,
        centerTitle: true,
      ),

    );
  }
}
