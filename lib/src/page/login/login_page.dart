import 'package:cart_rent/src/page/home/home_page.dart';
import 'package:cart_rent/src/page/login/forgotpass/forgot_password_page.dart';
import 'package:cart_rent/src/page/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String route = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isKeyboardVisible() {
    return MediaQuery.of(context).viewInsets.bottom == 0.0;
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
                            )),
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
                            )),
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
                    // SizedBox(
                    //   height: MediaQuery.of(context).orientation ==
                    //       Orientation.portrait
                    //       ? 90
                    //       : 10,
                    // ),
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
                  width: MediaQuery.of(context).size.width - 80,
                  height: 45,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, HomePage.route);
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
