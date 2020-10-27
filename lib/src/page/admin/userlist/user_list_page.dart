import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  static const String route = "user_list_page";

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Quản lý user",
          style: TextStyle(color: Colors.black),
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
                        leading: Icon(
                          Icons.circle,
                          size: 50,
                          color: Colors.grey,
                        ),
                        title: Text("username ${index + 1} - " + "email${index + 1}@gmail.com" , style: TextStyle(fontSize: 14),),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlatButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                color: Colors.orange[400],onPressed: (){ }, child: Text("Sửa ảnh", style: TextStyle(color: Colors.white),)),
                            FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                color: Colors.orange[600],onPressed: (){ }, child: Text("Lịch sử", style: TextStyle(color: Colors.white),)),
                            FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                color: Colors.orange[800],onPressed: (){ }, child: Text("Thêm điểm", style: TextStyle(color: Colors.white),)),
                          ],
                        ),

                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
