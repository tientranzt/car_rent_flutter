import 'package:flutter/material.dart';

class AddCategoryNewsPage extends StatefulWidget {
  static const String route = "add_category_news";

  @override
  _AddCategoryNewsPageState createState() => _AddCategoryNewsPageState();
}

class _AddCategoryNewsPageState extends State<AddCategoryNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Thêm bài đăng, category",
          style: TextStyle(fontSize: 30),
          key: Key("key string"),
        ),
      ), 
      body: Column(
        children: [
          Expanded(child: Text("Category Catch")),
          Column(
            children: [
              Text("header bar app"),
              Text("sub title "),
              Row(children: [
                Text("test code layout category"),
                Text("test data ")
              ],)
            ],
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(15), child: Text("Add category"))),
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(20), child: Text("News section"))),
          Expanded(
              child:
                  Container(padding: EdgeInsets.all(30), child: Text("end"))),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text("test"),
                    Text("data1"),
                    Text("data2"),
                    Text("data3"),
                    Text("data4"),
                    Text("data5"),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("text filed bottom"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
