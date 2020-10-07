import 'package:cart_rent/src/page/detail/detail_page.dart';
import 'package:cart_rent/src/page/home/home_page.dart';
import 'package:cart_rent/src/page/login/login_page.dart';
import 'package:cart_rent/src/page/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

void config() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeRight
  ]);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    config();

    return MaterialApp(
      routes: {
        HomePage.route : (context) => HomePage(),
        DetailPage.route: (context) => DetailPage(),
        LoginPage.route: (context) => LoginPage(),
        SignupPage.route: (context) => SignupPage(),
      },
      initialRoute: LoginPage.route,
      debugShowCheckedModeBanner: false,
      title: 'Car Rent',
    );
  }
}
