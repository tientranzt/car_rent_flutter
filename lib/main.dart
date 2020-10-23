import 'package:cart_rent/src/page/account/subpageaccount/account_info_page.dart';
import 'package:cart_rent/src/page/account/subpageaccount/account_rewards_page.dart';
import 'package:cart_rent/src/page/account/subpageaccount/history_order_page.dart';
import 'package:cart_rent/src/page/admin/addcar/add_car_page.dart';
import 'package:cart_rent/src/page/admin/addcategory/add_news_page.dart';
import 'package:cart_rent/src/page/detail/detail_page.dart';
import 'package:cart_rent/src/page/home/home_page.dart';
import 'package:cart_rent/src/page/login/forgotpass/forgot_password_page.dart';
import 'package:cart_rent/src/page/login/login_page.dart';
import 'package:cart_rent/src/page/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
        ForgotPasswordPage.route : (context) => ForgotPasswordPage(),
        AccountInfoPage.route : (context) => AccountInfoPage(),
        HistoryOrderPage.route : (context) => HistoryOrderPage(),
        AccountRewardsPage.route : (context) => AccountRewardsPage(),
        AddCategoryNewsPage.route: (context) => AddCategoryNewsPage(),
        AddCarPage.route: (context) => AddCarPage()
      },
      initialRoute: AddCarPage.route,
      debugShowCheckedModeBanner: false,
      title: 'Car Rent',

    );
  }
}
