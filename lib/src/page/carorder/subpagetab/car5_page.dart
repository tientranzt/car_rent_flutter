import 'package:cart_rent/src/model/CarModel.dart';
import 'package:cart_rent/src/services/FirebaseApi.dart';
import 'package:cart_rent/src/widget/order_car_widget.dart';
import 'package:flutter/material.dart';

class Car5Page extends StatefulWidget {
  @override
  _Car5PageState createState() => _Car5PageState();
}

class _Car5PageState extends State<Car5Page> {
  List<CarType> listCar5 = [];

  @override
  void initState() {
    super.initState();
    getCarList(collections: "car5").then((listCarType) => {
          setState(() {
            listCar5 = listCarType;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await getCarList(collections: "car5").then((listCarType) => {
              setState(() {
                listCar5 = listCarType;
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
              image: listCar5[index].image,
              desc: listCar5[index].desc,
              title: listCar5[index].car_title);
        },
        itemCount: listCar5.length,
      ),
    );
  }
}
