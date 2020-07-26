import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
          title : Text("Something") ,
          leading: Icon(Icons.menu), 
          actions: <Widget>[
            IconButton(icon: Icon(Icons.home) , onPressed: () {
              print("home clicked");
            },) ,
            IconButton(icon: Icon(Icons.notifications) , onPressed: () {
              print("notifications clicked");
            },) ,
          ],

        ), 
        body: Center(
          child: Text("Hello worm")
          )
        );
  }
}