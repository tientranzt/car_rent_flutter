import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  TextEditingController categoryContentEditingController = TextEditingController();
  int catIndex = 1;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String errorMessageCategory = "";
  List<String> listCat = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategory();
  }

  fetchCategory() async {
    listCat = [];
    firebaseFirestore.collection("category").get().then((value) {
      print(value.docs);

      value.docs.forEach((element) {
        print(element.data().keys.toString());
        String data = element.data().values.toString();
        setState(() {
          listCat.add(data.substring(1, data.length - 1));
        });
      });
    });
  }

  showMessageError({String message}) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Lỗi"),
            content: Text(message),
          );
        });
  }

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
              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
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
                                  return StatefulBuilder(
                                      builder: (context, state) => AlertDialog(
                                            title: Text("Thêm danh mục mới"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller: categoryContentEditingController,
                                                  decoration: InputDecoration(hintText: "Nhập danh mục"),
                                                ),
                                                errorMessageCategory.length == 0
                                                    ? Offstage()
                                                    : Container(
                                                        padding: EdgeInsets.symmetric(vertical: 10),
                                                        child: Text(
                                                          errorMessageCategory,
                                                          style: TextStyle(color: Colors.red, fontSize: 14),
                                                        ),
                                                      ),
                                                FlatButton(
                                                  onPressed: () {
                                                    print(categoryContentEditingController.text);
                                                    String cat = categoryContentEditingController.text;
                                                    if (cat == "") {
                                                      state(() {
                                                        errorMessageCategory = "Không được trống";
                                                      });
                                                    } else {
                                                      state(() {
                                                        errorMessageCategory = "";
                                                      });
                                                    }
                                                    if (errorMessageCategory.length == 0) {
                                                      firebaseFirestore.collection("category").add({cat: cat}).then((value) {
                                                        print(value);
                                                        Navigator.pop(context);
                                                        state(() {
                                                          fetchCategory();
                                                          categoryContentEditingController.text = "";
                                                        });
                                                      });
                                                    }
                                                  },
                                                  child: Text(
                                                    "Thêm",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                  color: Colors.orange,
                                                )
                                              ],
                                            ),
                                          ));
                                });
                          },
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                          ),
                        ),
                        ...listCat
                            .map((e) => Container(
                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Chip(
                                  label: Text(
                                    e,
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                )))
                            .toList()
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
                              ...listCat
                                  .map(
                                    (e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: listCat.indexOf(e),
                                    ),
                                  )
                                  .toList()
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
                            String title = textTitleEditingController.text;
                            String content = textContentEditingController.text;

                            if (title.length == 0) {
                              showMessageError(message: "Tiêu đề không được trống");
                            } else if (content.length == 0) {
                              showMessageError(message: "Nội dung không được trống");
                            }
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
