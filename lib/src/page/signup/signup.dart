import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static const String route = "signup";

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
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
                            )),
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
                            )),
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
                            )),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width - 80,
                  height: 45,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      print(emailController.text);
                      print(passController.text);
                    },
                    color: Colors.orange,
                    child: Text(
                      "Đăng ký",
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
