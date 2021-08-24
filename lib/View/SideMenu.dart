import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Controller/AppProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'Home.dart';
import 'Settings.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu>{
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Text(
                  AppLocalizations.of(context)!.title,
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
                )),
            decoration: BoxDecoration(
              color: Color.fromRGBO(57, 165, 82,1),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category, color: Colors.black),
            title: Text(AppLocalizations.of(context)!.categories ,
                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Home();
                  })
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black,),
            title: Text(AppLocalizations.of(context)!.settings,
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Settings();
                  })
              ),
            },
          ),
        ],
      ),
    );
  }
}