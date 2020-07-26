// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock/router.dart';
import 'package:flutter_stock/themes/styles.dart';

void main() {
  runApp(
    //DevicePreview(builder: (context) => MyApp()) , 
     MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      //  initialRoute: '/login',
      initialRoute: '/dashboard',
      routes : routes , 
      theme: appTheme() ,

      // locale :	DevicePreview.of(context).locale ,
		  // builder : DevicePreview.appBuilder
    );
  }
}


