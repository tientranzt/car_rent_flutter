import 'package:flutter/material.dart';

class AccountInfoPage extends StatefulWidget {
  static const String route = "accountInfo";

  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0EFF4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/account1.jpg",
                  height: 100,
                  width: 100,
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
                    onPressed: () {},
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
                    Text("Tên", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 3,),
                    Text("Nguyen Minh Tri"),
                  ],
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sinh nhật", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 3,),
                    Text("01/01/1987"),
                  ],
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Số điện thoại", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 3,),
                    Text("0946124142"),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
