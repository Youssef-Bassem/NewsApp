import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Api/ApiManager.dart';
import 'SideMenu.dart';
import 'package:news_app/View/HomeTabScreen.dart';
import '../Model/SourceResponse.dart';
import 'Search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenSearch extends StatefulWidget {
  static const color = Color(0xFF39A552);
  late var category;
  HomeScreenSearch(this.category);

  @override
  _HomeScreenSearchState createState() => _HomeScreenSearchState(this.category);
}

class _HomeScreenSearchState extends State<HomeScreenSearch> {
  late Future<SourceResponse> newsFuture;
  late Source source;
  late var category;

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  late String searchQuery = "";

  _HomeScreenSearchState(this.category);

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
        )),
        //title: Text('$Category'),
        backgroundColor: HomeScreenSearch.color,
        centerTitle: true,
        title: _isSearching ? _buildSearchField() : Text('$category'),
        actions: _buildActions(),
      ),
      drawer: SideMenu(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
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
                  builder: (buildContext, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.error);
                      return HomeTabs(snapshot.data!.sources, "");
                    } else if (snapshot.hasError) {
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
                                onPressed: refreshData,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
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
    newsFuture = getNewsSources(category);
    setState(() {});
  }
  //******************************* Search Bar *******************************

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.search,
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
              MaterialPageRoute(
                  builder: (context) => Search(category, searchQuery)),
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
