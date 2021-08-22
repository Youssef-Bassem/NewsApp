import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'SourecResponse.dart';


class HomeScreenSearch extends StatefulWidget {
  static const color = Color(0xFF39A552);

  @override
  _HomeScreenSearchState createState() => _HomeScreenSearchState();
}

class _HomeScreenSearchState extends State<HomeScreenSearch> {
  late Future<SourceResponse> newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = getHomeTabs();

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

  Future<SourceResponse> getHomeTabs() async
  {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=2c099c4f7ddd4a5abc64083e0ec4cc81
    final uri = Uri.https('newsapi.org', '/v2/everything', {'apikey':'1b90d7da7e3e4bfdb95a7e90565e52d3'} );
    final response = await http.get(uri);
    print(response.body);
    if( response.statusCode == 200 )
      {
        return SourceResponse.fromJson( jsonDecode(response.body) );
      }
    else
      {
        throw Exception(response.body);
      }
    //newsapi.org
    // v2/everything?q=bitcoin&apiKey=2c099c4f7ddd4a5abc64083e0ec4cc81
  }
}
