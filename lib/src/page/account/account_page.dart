import 'package:cart_rent/src/page/account/subpageaccount/account_info_page.dart';
import 'package:cart_rent/src/page/account/subpageaccount/account_rewards_page.dart';
import 'package:cart_rent/src/page/account/subpageaccount/history_order_page.dart';
import 'package:cart_rent/src/page/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void updateUI(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    print(mounted);
    String name = firebaseAuth.currentUser.displayName.split("%")[0];

    return Scaffold(
        backgroundColor: Color(0xffF0EFF4),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 2,
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.transparent, shape: BoxShape.circle),
            child: Image.asset("assets/images/account1.jpg"),
          ),
          title: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name == null
                      ? firebaseAuth.currentUser.email
                      : name,
                  style: TextStyle(
                      color: Colors.black87, fontSize: 15, wordSpacing: 2),
                ),
                Text(
                  "Người dùng mới",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountRewardsPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.stars_outlined,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Bích Long Co Rewards")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountInfoPage(updateUi: updateUI,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Thông tin người dùng")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryOrderPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Lịch sử đặt xe")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: Color(0xffF0EFF4),
              child: InkWell(
                onTap: () {
                  firebaseAuth.signOut().then((value) {
                    Navigator.pushReplacementNamed(context, LoginPage.route);
                  }).catchError((err) {
                    print(err);
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Đăng xuất"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
