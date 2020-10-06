import 'package:cart_rent/src/model/CarModel.dart';
import 'package:cart_rent/src/services/FirebaseApi.dart';
import 'package:cart_rent/src/widget/order_car_widget.dart';
import 'package:flutter/material.dart';

class TruckPage extends StatefulWidget {
  @override
  _TruckPageState createState() => _TruckPageState();
}

class _TruckPageState extends State<TruckPage> {
  List<CarType> listTruck = [];

  @override
  void initState() {
    super.initState();
    getCarList(collections: "truck").then((listCarType) => {
          setState(() {
            listTruck = listCarType;
          })
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await getCarList(collections: "truck").then((listCarType) => {
              setState(() {
                listTruck = listCarType;
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
              image: listTruck[index].image,
              desc: listTruck[index].desc,
              title: listTruck[index].car_title);
        },
        itemCount: listTruck.length,
      ),
    );
  }
}
