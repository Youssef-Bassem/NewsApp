import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Home.dart';
import 'package:news_app/Model/SourceResponse.dart';
import 'package:news_app/View/TabItem.dart';

import '../NewsFragment.dart';

class HomeTabs extends StatefulWidget {
  List<Source> sources;
  HomeTabs(this.sources);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Container(
        padding: EdgeInsets.only(top: 8),
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources
                    .map((source) => TabItem(source,
                        widget.sources.indexOf(source) == selectedIndex))
                    .toList()),
            Expanded(
              child: TabBarView(
                children: widget.sources.map((source) => NewsFragment(source)).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
