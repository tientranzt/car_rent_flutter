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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Tên Xe"),
                  )),
              Container(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    maxLines: 20,
                    decoration: InputDecoration(hintText: "Mô tả xe"),
                  )),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    print("add car");
                  },
                  child: Text(
                    "Thêm xe",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
