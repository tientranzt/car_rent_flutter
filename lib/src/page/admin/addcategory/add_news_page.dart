import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCategoryNewsPage extends StatefulWidget {
  static const String route = "add_category_news";

  @override
  _AddCategoryNewsPageState createState() => _AddCategoryNewsPageState();
}

class _AddCategoryNewsPageState extends State<AddCategoryNewsPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Color(0xffF0EFF4),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Thêm bài viết",
              maxLines: 1,
              style: TextStyle(
                  color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                          child: Center(
                              child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                        ),
                        Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Chip(label: Text("Cat1"))),
                        Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Chip(label: Text("Cat2"))),
                        Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Chip(label: Text("Cat3"))),
                        Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Chip(label: Text("Cat4"))),
                        Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Chip(label: Text("Cat5"))),
                        Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Chip(label: Text("Cat6"))),
                        Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Chip(label: Text("Cat7"))),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Tiêu đề tài viết",
                        ),
                      ),
                      TextField(
                        maxLines: 20,
                        decoration: InputDecoration(
                          hintText: "Nội dung",
                        ),
                      ),
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text("Cat1"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Cat2"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Cat3"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("Cat4"),
                            value: 4,
                          ),
                        ],
                        onChanged: (v) {
                          print(v);
                        },
                        value: 1,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Thêm bài viết",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
