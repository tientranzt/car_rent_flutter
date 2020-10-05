import 'package:cart_rent/src/model/CarModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<CarType>> getCarList({String collections}) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<CarType> listCar = [];
  await firebaseFirestore.collection(collections).get().then((value) {
    List<QueryDocumentSnapshot> dataList = value.docs;
    dataList.forEach((element) {
      var data = element.data();

      listCar.add(CarType(
          car_owner: data['car_owner'],
          image: data['image'],
          car_title: data['car_title'],
          create_date: data['create_date'],
          desc: data['desc'],
          phone_owner: data['phone_owner'],
          update_date: data['update_date'],
          user_post: data['user_post']));
    });

    if (dataList.length == 0) {
      print("Empty list in $collections");
    } else {
      print("have data in $collections");
    }
  });
  return listCar;
}