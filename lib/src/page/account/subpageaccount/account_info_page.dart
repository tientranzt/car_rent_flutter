import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AccountInfoPage extends StatefulWidget {
  static const String route = "accountInfo";
  final Function updateUi;

  AccountInfoPage({this.updateUi});

  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File _imageFile;
  String _uploadedFileURL = "";
  final picker = ImagePicker();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> listUrlImageString = [];

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child(
        '${firebaseAuth.currentUser.uid}/${firebaseAuth.currentUser.uid}-${DateTime.now().microsecond}');
    StorageUploadTask uploadTask = storageReference.putFile(_imageFile);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        print(_uploadedFileURL);
        firebaseFirestore
            .collection('${firebaseAuth.currentUser.uid}/')
            .add({"image": _uploadedFileURL});
        getUrlImageLink();
      });
    });
  }

  Future pickImage() async {
    await picker.getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _imageFile = File(image.path);
        uploadFile();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUrlImageLink();
  }

  getUrlImageLink() {
    listUrlImageString = [];
    firebaseFirestore
        .collection("${firebaseAuth.currentUser.uid}/")
        .get()
        .then((value) {
      print(value.docs);
      List<QueryDocumentSnapshot> listData = value.docs;
      listData.forEach((element) {
        print(element.data()['image']);
        setState(() {
          listUrlImageString.add(element.data()['image']);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(listUrlImageString);
    String name = "";
    String date = "";
    String phone = "";
    if (firebaseAuth.currentUser.displayName != null) {
      String fullString = firebaseAuth.currentUser.displayName;
      name = fullString.split("%")[0];
      date = fullString.split("%")[1];
      phone = fullString.split("%")[2];
    }

    return Scaffold(
      backgroundColor: Color(0xffF0EFF4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 300,
                            );
                          });
                    },
                    child: Image.asset(
                      "assets/images/account1.jpg",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(color: Colors.orange),
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.orange,
                        size: 18,
                      ),
                      Text(" | "),
                      Text(" Khách hàng mới "),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thông tin cá nhân",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  FlatButton(
                      onPressed: () {
                        print(firebaseAuth.currentUser.displayName);
                        nameController.text = name;
                        dateController.text = date;
                        phoneController.text = phone;

                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(builder: (context, state) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 8),
                                        child: TextField(
                                          controller: nameController,
                                          decoration: InputDecoration(
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.orange,
                                                      width: 1)),
                                              hintText:
                                                  name == "" ? "Tên" : name),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 8),
                                        child: TextField(
                                          controller: dateController,
                                          keyboardType: TextInputType.datetime,
                                          decoration: InputDecoration(
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.orange,
                                                      width: 1)),
                                              hintText: date == ""
                                                  ? "Ngày sinh"
                                                  : date),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 8),
                                        child: TextField(
                                          controller: phoneController,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.orange,
                                                      width: 1)),
                                              hintText: phone == ""
                                                  ? "Số điện thoại"
                                                  : phone),
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(20),
                                          child: FlatButton(
                                              color: Colors.orange,
                                              onPressed: () {
                                                String nameDatePhone =
                                                    nameController.text +
                                                        "%" +
                                                        dateController.text +
                                                        "%" +
                                                        phoneController.text;

                                                firebaseAuth.currentUser
                                                    .updateProfile(
                                                        displayName:
                                                            nameDatePhone)
                                                    .then((value) {
                                                  print("update info success");
                                                  widget.updateUi();
                                                  setState(() {});
                                                }).catchError((err) {
                                                  print(err);
                                                });
                                              },
                                              child: Text(
                                                "Cập nhật",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )))
                                    ],
                                  ),
                                );
                              });
                            });
                      },
                      child: Text("Đổi",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tên",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(name == "" ? "Tên hiển thị" : name),
                    ],
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sinh nhật",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(date == "" ? "Ngày sinh của bạn" : date),
                    ],
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Số điện thoại",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(phone == "" ? "Số điện thoại của bạn" : phone),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                FlatButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: Text("Tải ảnh lên"))
              ],
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: listUrlImageString
                      .map((e) => Container(
                          margin: EdgeInsets.all(5),
                          child: Image.network(
                            e,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )))
                      .toList(),
                ),
            ),

          ],
        ),
      ),
    );
  }
}
