import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const String route = "/detail";
  final String image;
  final String title;
  final String description;

  const DetailPage({this.title, this.image, this.description});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * .3
                  : MediaQuery.of(context).size.height * .7,
              child: Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "4 tháng 9, 2020",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.description,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      textAlign: TextAlign.start,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
