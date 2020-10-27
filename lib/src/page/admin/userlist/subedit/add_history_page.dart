import 'package:flutter/material.dart';

class AddHistoryPage extends StatefulWidget {
  @override
  _AddHistoryPageState createState() => _AddHistoryPageState();
}

class _AddHistoryPageState extends State<AddHistoryPage> {
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
          child: Text("Thêm lịch sử"),
        ),
      ),
    );
  }
}
