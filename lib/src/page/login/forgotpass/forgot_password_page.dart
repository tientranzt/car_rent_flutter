import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String route = "forgotpass";

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
          elevation: 2,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            "Quên mật khẩu",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 30),
                child: Text("Nhập email để lấy lại mật khẩu")),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email của bạn",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25)),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Gửi",
                  style: TextStyle(color: Colors.white),
                ),
                // color: Colors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}


