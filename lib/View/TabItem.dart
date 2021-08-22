import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  late Source source;
  late bool isSelected;

  TabItem(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return isSelected
        ?Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              source.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        : Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Theme.of(context).primaryColor,width: 1)
            ),
            child: Text(
              source.name,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          );
  }
}
