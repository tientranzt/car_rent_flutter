import 'package:flutter/material.dart';

class HistoryOrderPage extends StatefulWidget {
  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("app bar"),
            ],
          ),
          SizedBox(
            height: 0,
          ),
          Container(
            child: Text("hình ảnh"),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Center(
              child: Text("lịch sử đặt xe"),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Center(
              child: Text("nút nhấn"),
            ),
          ),
        ],
      ),
    );
  }
}
