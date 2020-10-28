import 'package:flutter/material.dart';

class ImageEditPage extends StatefulWidget {
  @override
  _ImageEditPageState createState() => _ImageEditPageState();
}

class _ImageEditPageState extends State<ImageEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0EFF4),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Sửa ảnh",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Wrap(
          spacing: 15,
          alignment: WrapAlignment.center,
          runSpacing: 15,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Image.asset(
              "assets/images/car0.jpg",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/car1.jpg",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/car2.jpg",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/car3.jpg",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/car4.jpg",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
