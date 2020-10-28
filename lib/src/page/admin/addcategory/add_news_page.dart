import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCategoryNewsPage extends StatefulWidget {
  static const String route = "add_category_news";

  @override
  _AddCategoryNewsPageState createState() => _AddCategoryNewsPageState();
}

class _AddCategoryNewsPageState extends State<AddCategoryNewsPage> {
  TextEditingController textTitleEditingController = TextEditingController();
  TextEditingController textContentEditingController = TextEditingController();
  int catIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
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
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Thêm danh mục mới"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                              hintText: "Nhập danh mục"),
                                        ),
                                        FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Thêm",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: Colors.orange,
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
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
                        ),
                        ...List.generate(
                            7,
                            (index) => Container(
                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Chip(
                                  label: Text(
                                    "Cat ${index + 1}",
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                )))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: textTitleEditingController,
                        decoration: InputDecoration(
                          hintText: "Tiêu đề tài viết",
                        ),
                      ),
                      TextField(
                        controller: textContentEditingController,
                        maxLines: 16,
                        decoration: InputDecoration(
                          hintText: "Nội dung",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Chọn mục",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                              setState(() {
                                catIndex = v;
                              });
                            },
                            value: catIndex,
                          )
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: () {
                            print(textTitleEditingController.text);
                            print(textContentEditingController.text);
                          },
                          child: Text(
                            "Thêm bài viết",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.orange,
                        ),
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
