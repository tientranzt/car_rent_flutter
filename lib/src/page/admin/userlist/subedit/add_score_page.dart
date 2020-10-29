import 'package:flutter/material.dart';
import 'dart:math';

class AddScorePage extends StatefulWidget {
  @override
  _AddScorePageState createState() => _AddScorePageState();
}

class _AddScorePageState extends State<AddScorePage> {
  @override
  Widget build(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Show snack")));
    return Scaffold(
        backgroundColor: Color(0xffF0EFF4),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Thêm điểm",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.system_update_alt,
                  color: Colors.orange,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Cập nhật điểm"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: InputDecoration(hintText: "Nhập điểm"),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Thêm",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.orange,
                              )
                            ],
                          ),
                        );
                      });
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(3, (index) {
              return ListTile(
                title: Text("Update at 13:3$index"),
                subtitle: Text("username - score ${index + 5}"),
              );
            }),
          ),
        ));
  }
}
