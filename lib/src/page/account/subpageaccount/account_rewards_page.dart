import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AccountRewardsPage extends StatefulWidget {
  static const String route = "rewardAccount";

  @override
  _AccountRewardsPageState createState() => _AccountRewardsPageState();
}

class _AccountRewardsPageState extends State<AccountRewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0EFF4),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Thông tin thành viên",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: double.infinity,
            height: 180,
            child: Stack(
              // alignment: Alignment.bottomLeft,

              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                  ),
                  width: double.infinity,
                  height: 200,
                ),
                Positioned(
                  left: 25,
                  bottom: 25,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nguyen Minh Tri",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Text("Khách hàng mới",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Icon(
                            Icons.star_border,
                            size: 24,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(color: Colors.grey[400]),
                      width: 0.5,
                      height: 60,
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "0",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn đang là thành viên mới",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Chưa tích điểm",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.brown, shape: BoxShape.circle),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Đồng",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Bạc",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.yellow, shape: BoxShape.circle),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Vàng",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent, shape: BoxShape.circle),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Mới",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text("Bạn đang đạt hạng đồng"),
                      Text("Đổi quà không ảnh hưởng đến thứ hạng", style: TextStyle(color: Colors.orange),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
