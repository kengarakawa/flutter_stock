import 'package:flutter/material.dart';
// import 'package:flutter_stock/themes/styles.dart';

class MediaQueryScreen extends StatefulWidget {
  MediaQueryScreen({Key key}) : super(key: key);

  @override
  _MediaQueryScreenState createState() => _MediaQueryScreenState();
}

class _MediaQueryScreenState extends State<MediaQueryScreen> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double appbarHeight = 100.0; // default = 56

    

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appbarHeight),
          child: AppBar(title: Text('MediaQuery'))),
        body: Column(
          children: <Widget>[
            Container(
              
                width: MediaQuery.of(context).size.width, 
                height: MediaQuery.of(context).size.height * 0.4, 
                child: Center(child: Text('Screen size: $screensize', style: TextStyle(fontSize: 24.0))) , 
                color: Colors.green[600] 
                
            ),
            
            Container(
              
                width: MediaQuery.of(context).size.width, 
                height: MediaQuery.of(context).size.height * 0.2, 
                child: Center(child: Text('Screen width: ${screenWidth.toStringAsFixed(2)}', style: TextStyle(fontSize: 24.0))) ,
                color: Colors.orange 

                
            ),
            
            Container(
              
                width: MediaQuery.of(context).size.width, 
                height: MediaQuery.of(context).size.height * 0.4 - appbarHeight -24, 
                child: Center(child: Text('Screen height: ${screenHeight.toStringAsFixed(2)}', style: TextStyle(fontSize: 24.0))) ,
                color: Colors.purple 

                
            ),

            
                
          ],
        ));
  }
}
