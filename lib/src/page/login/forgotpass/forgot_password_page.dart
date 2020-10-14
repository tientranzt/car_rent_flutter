import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String route = "forgotpass";

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void showAlertDialog({String message}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Thông báo",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            content: Text(
              message,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Thoát",
                      style: TextStyle(
                        fontSize: 12,
                      )))
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
                controller: emailController,
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
                onPressed: () {
                  String email = emailController.text;
                  bool isEmail = EmailValidator.validate(email);

                  if(isEmail){
                    firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
                      showAlertDialog(message: "Kiểm tra mail để khôi phục mật khẩu");
                      emailController.text = "";
                    }).catchError((err){
                      print(err);
                    });
                  }
                  else{
                    showAlertDialog(message: "Email không hợp lệ");
                  }

                },
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


