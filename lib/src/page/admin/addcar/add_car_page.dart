import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCarPage extends StatefulWidget {
  static const String route = "add_new_car";

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  TextEditingController titleAddCar = TextEditingController();
  TextEditingController descriptionAddCar = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  int carIndex = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  showMessageError({String message}) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Lỗi"),
            content: Text(message),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Thoát"))
            ],
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: TextField(
                      controller: titleAddCar,
                      decoration: InputDecoration(hintText: "Tên Xe"),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: TextField(
                      controller: descriptionAddCar,
                      maxLines: 16,
                      decoration: InputDecoration(hintText: "Mô tả xe"),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chọn loại",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text("Xe năm chổ"),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            child: Text("Xe bảy chổ"),
                            value: 7,
                          ),
                          DropdownMenuItem(
                            child: Text("Xe bán tải"),
                            value: 9,
                          ),
                        ],
                        onChanged: (v) {
                          setState(() {
                            carIndex = v;
                          });
                        },
                        value: carIndex,
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: FlatButton(
                    color: Colors.orange,
                    onPressed: () {
                      String title = titleAddCar.text;
                      String content = descriptionAddCar.text;

                      if (title.length == 0) {
                        showMessageError(message: "Tên xe không được trống");
                      } else if (content.length == 0) {
                        showMessageError(message: "Mô tả xe không được trống");
                      }

                      if (title.length > 0 && content.length > 0) {
                        String collection = "";

                        if (carIndex == 5) collection = "car5";
                        if (carIndex == 7) collection = "car7";
                        if (carIndex == 9) collection = "truck";
                        print(titleAddCar.text);
                        print(descriptionAddCar.text);
                        print(carIndex);

                        //car_owner / car_title / create_date / desc / image / phone_owner / update_date / user_post

                        DateTime date = DateTime.now();

                        firebaseFirestore
                            .collection(collection)
                            .add({
                              "car_owner": "",
                              "car_title": title,
                              "create_date": date.toString(),
                              "desc": content,
                              "image": "",
                              "phone_owner": "",
                              "update_date": "",
                              "user_post": ""
                            })
                            .then((value) {
                          print(value);
                          titleAddCar.text = "";
                          descriptionAddCar.text = "";
                          showDialog(context: context, builder: (content)=>
                            AlertDialog(
                              title: Text("Thông báo"),
                              content: Text("Thêm xe thành công"),
                              actions: [
                                FlatButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Thoát"))
                              ],
                            )
                          );
                        })
                            .catchError((err) => print(err));

                      }
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
      ),
    );
  }
}
