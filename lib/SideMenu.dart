import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Settings.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu>{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Text(
                  'News App!',
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
                )),
            decoration: BoxDecoration(
              color: Color.fromRGBO(57, 165, 82,1),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category, color: Colors.black),
            title: Text('Categories' ,
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
            title: Text('Settings',
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