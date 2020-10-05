import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

Widget carOrderItem({int index, String image, String desc, String title}) {
  return LayoutBuilder(
    builder: (context, constraint) {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              image,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              colorBlendMode: BlendMode.darken,
                              isAntiAlias: true,
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        width: double.infinity,
                        color: Color(0xffF7F7F7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                "Giới thiệu xe",
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          desc * 50,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              color: Color(0xffFF9600),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Gọi xe",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                await Launcher.launch("tel://0939111111");
                              },
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          child: Column(
            children: [
              Container(
                width: constraint.maxWidth,
                height: constraint.maxHeight * 0.50,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    colorBlendMode: BlendMode.darken,
                    isAntiAlias: true,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ),
              ),
              Container(
                width: constraint.maxWidth,
                // height: constraint.maxHeight * 0.35,
                padding: EdgeInsets.all(10),
                child: Text(
                  desc,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
