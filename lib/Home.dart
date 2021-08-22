import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const color = Color(0xFF39A552);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        )),
        title: Text('News App'),
        backgroundColor: color,
        centerTitle: true,
      ),
      drawer: Container(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/pattern.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    'Pick your category of interest',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: myRow(
                          "assets/sports@3x.png", "assets/politics@3x.png")),
                  Expanded(
                      child: myRow(
                          "assets/health@3x.png", "assets/business@3x.png")),
                  Expanded(
                      child: myRow(
                          "assets/enviroment@3x.png", "assets/science@3x.png")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myRow(String image1, String image2) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
              iconSize: 148, onPressed: () {}, icon: Image.asset(image1)),
        ),
        Expanded(
          child: IconButton(
              iconSize: 148, onPressed: () {}, icon: Image.asset(image2)),
        ),
      ],
    );
  }
}
