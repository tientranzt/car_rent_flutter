import 'package:flutter/material.dart';

class HistoryOrderPage extends StatefulWidget {
  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  Widget renderLayout({double size}) {
    if (size > 35) {
      return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.red,
                width: 5,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return
    
      Scaffold(
      body: Center(child: renderLayout(size: 70)),
    );

    //   SafeArea(
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Icon(
    //             Icons.arrow_back_ios,
    //             color: Colors.white,
    //             size: 12,
    //           ),
    //           Text(
    //             "Lịch sủ đặt hàng",
    //             style: TextStyle(fontSize: 14),
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: 50,
    //       ),
    //       Container(
    //         child: Image.asset("assets/images/order_car4.png"),
    //       ),
    //       Text(
    //         "Bạn chưa có lịch sử đặt xe",
    //         style: TextStyle(fontSize: 14),
    //       ),
    //       FlatButton(
    //         onPressed: () {},
    //         child: Text("Đặt xe ngay"),
    //         minWidth: 300,
    //         color: Colors.white,
    //         shape:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    //       )
    //     ],
    //   ),
    // );
  }
}
