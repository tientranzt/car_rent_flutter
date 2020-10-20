import 'package:cart_rent/src/page/home/home_page.dart';
import 'package:flutter/material.dart';

class HistoryOrderPage extends StatefulWidget {
  static const String route = "historyAccount";
  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0EFF4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Lịch sử đặt xe", style: TextStyle(color: Colors.black, fontSize: 15),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 100, right: 100),
            child: Image.asset("assets/images/order_car4.png", fit: BoxFit.cover,),
          ),
          Container(
            child: Text("Bạn chưa có lịch sử đặt xe"),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 50, right: 50),            width: double.infinity,
            child: FlatButton(
              color: Colors.orange,
              onPressed: (){
                  Navigator.pushReplacementNamed(context, HomePage.route, arguments: 1);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Text("Đặt xe ngay", style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
