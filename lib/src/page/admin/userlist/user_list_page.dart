import 'package:cart_rent/src/page/admin/userlist/subedit/add_history_page.dart';
import 'package:cart_rent/src/page/admin/userlist/subedit/add_score_page.dart';
import 'package:cart_rent/src/page/admin/userlist/subedit/image_edit_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  static const String route = "user_list_page";

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Quản lý user",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              10,
              (index) => Material(
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: ListTile(
                        leading: Container(
                          child: Image.asset("assets/images/account1.jpg"),
                        ),
                        title: Text(
                          "username ${index + 1} - " +
                              "email${index + 1}@gmail.com",
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: Colors.orange[400],
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ImageEditPage()));
                                  },
                                  child: Text(
                                    "Sửa ảnh",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              SizedBox(width: 10,),
                              FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: Colors.orange[600],
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddHistoryPage()));
                                  },
                                  child: Text(
                                    "Lịch sử",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              SizedBox(width: 10,),
                              FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: Colors.orange[800],
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddScorePage()));
                                  },
                                  child: Text(
                                    "Thêm điểm",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
