import 'package:flutter/material.dart';

class AddCarPage extends StatefulWidget {
  static const String route = "add_new_car";

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thêm xe",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Text("Tên xe"),
              ),
              Container(
                  padding: EdgeInsets.all(30),child: TextField()),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Text("Mô tả"),
              ),
              Container(
                  padding: EdgeInsets.all(30),child: TextField()),
            ],
          ),
        ),
      ),
    );
  }
}
