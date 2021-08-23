import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SideMenu.dart';

class  Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _value = 1;
  static const color = Color(0xFF39A552);

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
        title: Text('News App'),
        backgroundColor: color,
        centerTitle: true,
      ),

      drawer: SideMenu(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pattern.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 30, 0, 0),
              child: Text(
                  'Language',
                  style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w900)
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: DropdownButtonFormField(
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  ),
                  border: const OutlineInputBorder(),
                ),
                value: _value,
                items: [
                  DropdownMenuItem(
                    onTap: (){
                    },
                    child: Text("English"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    onTap: (){
                    },
                    child: Text("Arabic"),
                    value: 2,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                     _value = value as int;
                  });
                },
                style: TextStyle(color: Colors.green , ) , iconEnabledColor: Colors.green,

                hint:Text('$_value'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}