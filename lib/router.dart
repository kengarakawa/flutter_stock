// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock/screens/dashboard/dashoard_screen.dart';
// import 'package:flutter_stock/screens/home/home_screen.dart';
import 'package:flutter_stock/screens/login/login_screen.dart';
import 'package:flutter_stock/screens/media_query/media_layout.dart';
import 'package:flutter_stock/screens/media_query/media_query.dart';

// final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
//   "/"  : (BuildContext context) => MediaLayoutScreen() , 
//   "home"  : (BuildContext context) => MyHomePage() , 
//   "media_query" : (BuildContext context) => MediaQueryScreen()
// };


final Map <String,WidgetBuilder> routes = <String,WidgetBuilder> {
    "/" : (BuildContext context) => MediaLayoutScreen() , 
    "/media_query" : (BuildContext context) => MediaQueryScreen() ,
    "/login" : (BuildContext context) => LoginScreen() , 
    "/about" : (BuildContext context) => LoginScreen() ,
    "/contact" : (BuildContext context) => LoginScreen() ,
    "/term" : (BuildContext context) => LoginScreen() , 
    "/dashboard" : (BuildContext context) => DashboardScreen() , 


};