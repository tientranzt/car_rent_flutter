import 'package:cart_rent/src/page/home/home_page.dart';
import 'package:cart_rent/src/page/login/forgotpass/forgot_password_page.dart';
import 'package:cart_rent/src/page/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static const String route = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void showAlertDialog({String message}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Thông báo",
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
                  child: Text(
                    "Thoát",
                  ))
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
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          "Chào bạn,",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 10, left: 25, bottom: 20),
                        child: Text("Nhập tài khoản để đăng nhập")),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ForgotPasswordPage.route);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Quên mật khẩu",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignupPage();
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Chưa có tài khoản?",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10
                          : 5),
                  width: MediaQuery.of(context).size.width - 60,
                  height: 45,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      String userEmail = emailController.text;
                      String userPass = passController.text;

                      firebaseAuth
                          .signInWithEmailAndPassword(
                              email: userEmail, password: userPass)
                          .then((user) {
                        print(user);
                        Navigator.pushReplacementNamed(context, HomePage.route);
                      }).catchError((err) {
                        print(err);
                        print(err.hashCode);
                        if (err.hashCode == 218430393) {
                          showAlertDialog(message: "Mật khẩu không đúng");
                        } else if (err.hashCode == 246276089) {
                          showAlertDialog(message: "Email không đúng");
                        } else if (err.hashCode == 849834254) {
                          showAlertDialog(
                              message: "Tài khoản mật khẩu không được trống");
                        } else {
                          showAlertDialog(message: "Lỗi mạng không xác định");
                        }
                      });
                    },
                    color: Colors.orange,
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(color: Colors.white),
                    ),
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
