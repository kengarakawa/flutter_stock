import 'package:flutter/material.dart';

class MediaLayoutScreen extends StatefulWidget {
  MediaLayoutScreen({Key key}) : super(key: key);

  @override
  _MediaLayoutScreenState createState() => _MediaLayoutScreenState();
}

class _MediaLayoutScreenState extends State<MediaLayoutScreen> {

  gridViewForPhone(Orientation orientation) {
    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 3 : 6,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 0.5,

      children: List.generate(100, (index) {
          return Card(
            child: Container(
              alignment: Alignment.center,
              color: Colors.teal , 
              child: Text('${index + 1}') 
            )
          );
        })
      ,
    );
  }

  gridViewForTablet(Orientation orientation) {
    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 5 : 10,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 0.5,

      children: List.generate(100, (index) {
          return Card(
            child: Container(
              alignment: Alignment.center,
              color: Colors.orange , 
              child: Text('${index + 1}') 
            )
          );
        })
      ,
    );
  }

  


  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool isMobile = shortestSide < 600.0;

    if(isMobile) {
      //return gridViewForPhone(orientation);
    }



    return Scaffold(
        appBar: AppBar(
          title: Text('Media Layout screen'),
        ),
        body: isMobile ? gridViewForPhone(orientation) : gridViewForTablet(orientation) ,
    );
  }
}
