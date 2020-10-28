import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class SignupPage extends StatefulWidget {
  static const String route = "signup";

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void showAlertDialog({String message}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Thông báo"),
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Đăng ký,",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10, left: 25, bottom: 20),
                      child: Text("Nhập thông tin để đăng ký")),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email của bạn",
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: TextField(
                      controller: passController,
                      decoration: InputDecoration(
                        hintText: "Mật khẩu của bạn",
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            )),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: TextField(
                      controller: passConfirmController,
                      decoration: InputDecoration(
                        hintText: "Xác nhận mật khẩu",
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            )),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                width: MediaQuery.of(context).size.width - 80,
                height: 45,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    bool isEmailValid =
                        EmailValidator.validate(emailController.text);
                    bool isPassLengthValid = passController.text.length >= 6;
                    bool isPassConfirmValid =
                        passController.text == passConfirmController.text;
                    String userEmail = emailController.text;
                    String userPass = passController.text;

                    if (!isEmailValid) {
                      showAlertDialog(message: "Email không hợp lệ");
                    }

                    if (!isPassLengthValid) {
                      showAlertDialog(message: "Mật khẩu cần lớn hơn 6 kí tự");
                    }

                    if (!isPassConfirmValid) {
                      showAlertDialog(message: "Xác nhận mật khẩu không trùng");
                    }

                    if (isEmailValid &&
                        isPassConfirmValid &&
                        isPassLengthValid) {
                      firebaseAuth
                          .createUserWithEmailAndPassword(
                              email: userEmail, password: userPass)
                          .then((user) {
                        emailController.text = "";
                        passController.text = "";
                        passConfirmController.text = "";

                        Navigator.pop(context);
                      }).catchError((err) {
                        if (err.hashCode == 86194409) {
                          showAlertDialog(message: "Email đã tồn tại");
                        } else {
                          showAlertDialog(message: "Lỗi mạng không xác định");
                        }
                      });
                    }
                  },
                  color: Colors.orange,
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
