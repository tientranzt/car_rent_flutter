import 'package:cart_rent/src/page/carorder/subpagetab/car5_page.dart';
import 'package:cart_rent/src/page/carorder/subpagetab/car7_page.dart';
import 'package:cart_rent/src/page/carorder/subpagetab/truck_page.dart';
import 'package:flutter/material.dart';

class CarOrder extends StatefulWidget {
  @override
  _CarOrderState createState() => _CarOrderState();
}

class _CarOrderState extends State<CarOrder> {
  var contentDetailBody = [Car5Page(), Car7Page(), TruckPage()];
  var currentTabBarIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: currentTabBarIndex,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF0EFF4),
            appBar: TabBar(
              indicatorColor: Color(0xffFF9600),
              onTap: (index) {
                setState(() {
                  currentTabBarIndex = index;
                });
              },
              tabs: [
                Tab(
                  child: Text(
                    "Xe 5 chổ",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                Tab(
                  child: Text(
                    "Xe 7 chổ",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                Tab(
                  child: Text(
                    "Bán tải",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
            body: TabBarView(
              children: [Car5Page(), Car7Page(), TruckPage()],
            )),
      ),
    );
  }
}
