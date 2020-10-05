import 'package:cart_rent/src/model/CarModel.dart';
import 'package:cart_rent/src/services/FirebaseApi.dart';
import 'package:cart_rent/src/widget/order_car_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Car7Page extends StatefulWidget {
  @override
  _Car7PageState createState() => _Car7PageState();
}

class _Car7PageState extends State<Car7Page> {
  List<CarType> listCar7 = [];

  @override
  void initState() {
    super.initState();
    getCarList(collections: "car7").then((listCarType) => {
          setState(() {
            listCar7 = listCarType;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getCarList(collections: "car7").then((listCarType) => {
              setState(() {
                listCar7 = listCarType;
              })
            });
      },
      child: GridView.builder(
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return carOrderItem(
              index: index,
              image: listCar7[index].image,
              desc: listCar7[index].desc,
              title: listCar7[index].car_title
          );
        },
        itemCount: listCar7.length,
      ),
    );
  }
}
