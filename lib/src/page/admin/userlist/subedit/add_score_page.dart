import 'package:flutter/material.dart';

class AddScorePage extends StatefulWidget {
  @override
  _AddScorePageState createState() => _AddScorePageState();
}

class _AddScorePageState extends State<AddScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF0EFF4),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Center(
            child: Text("Thêm điểm"),
          ),
        ));
  }
}
