import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatefulWidget {
  static const String route = "forgotpass";
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text("Quên mật khẩu"),
      ),
    );
  }
}
