import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Api/ApiManager.dart';
import 'package:news_app/View/HomeTabScreen.dart';
import 'Model/SourceResponse.dart';
import 'Search.dart';


class HomeScreenSearch extends StatefulWidget {
  static const color = Color(0xFF39A552);
  late var Category;

  HomeScreenSearch(this.Category);

  @override
  _HomeScreenSearchState createState() => _HomeScreenSearchState(this.Category);
}

class _HomeScreenSearchState extends State<HomeScreenSearch> {
  late Future<SourceResponse> newsFuture;
  late Source source;
  late var Category;

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  late String searchQuery = "$Category";

  _HomeScreenSearchState(this.Category);

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
        title: _isSearching ? _buildSearchField() : Text('$Category'),
        actions: _buildActions(),
      ),

      drawer: Container(
        color: Colors.white,
        child: Text('$searchQuery'),
      ),

      body: FutureBuilder<SourceResponse>(
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
    );
  }

  //******************************* Search Bar *******************************

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.done),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Search(Category,searchQuery)),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);

              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });


  }

}
