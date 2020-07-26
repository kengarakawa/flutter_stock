import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  TermScreen({Key key}) : super(key: key);

  @override
  _TermScreenState createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลการใช้งาน'),
      ),
       body: Center(
         child: Text('เนื้อหาหน้าข้อมูลการใช้งาน'),
       ),
    );
  }
}