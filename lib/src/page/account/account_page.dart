import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF0EFF4),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 2,
          leading: GestureDetector(
              onTap: () {},
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: Image.asset("assets/images/account1.jpg"),
              )),
          title: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nguyen Minh Tri",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                  semanticsLabel: "",
                ),
                Text(
                  "Người dùng mới",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ),
          actions: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.ac_unit,
                color: Colors.orange,
              ),
            ))
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text("reward"),
                  Text("thôn tin tài khoản"),
                  Text("Lịch sử"),
                  Text("Đăng xuất"),
                ],
              ),
            )
          ],
        ));
  }
}

class ColumnCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Colors.orange,
        bottomOpacity: 0.9,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [Icon(Icons.stars), Text("Rewards")],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Icon(Icons.account_circle),
                  Text("Thông tin tài khoản")
                ],
              ),
            ),
            Container(
              child: Row(
                children: [Icon(Icons.account_circle), Text("Lịch sử đặt xe")],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Image.asset("assets/images/account1.jpg"),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Dong 1"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Dong 2"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Dong 3"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Dong 4"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Đăng xuất"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text("test1"),
                    ),
                    Container(
                      child: Text("test2"),
                    ),
                    Container(
                      child: Text("test3"),
                    ),
                    Container(
                      child: Text("test4"),
                    ),
                    Container(
                      child: Text("test5"),
                    ),
                    Container(
                      child: Text("test6"),
                    ),
                    Container(
                      child: Text("test7"),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text("test row 1"),
                        ),
                        Container(
                          child: Text("test row 2"),
                        ),
                        Container(
                          child: Text("test row 3"),
                        ),
                        Container(
                          child: Text("test row 4"),
                        ),
                        Container(
                          child: Text("test row 5"),
                        ),
                        Container(
                          child: Text("test row 6"),
                        ),
                        Container(
                          child: Text("test row 7"),
                        ),
                        Container(
                          child: Text("test row 8"),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "test row 1",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "test row 2",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "test row 3",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "test row 4",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "test row 5",
          style: TextStyle(color: Colors.black),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.redAccent,
              ),
              child: Text("1"),
            ),
            Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage("assets/images.jpg"),
                      fit: BoxFit.cover,
                      alignment: Alignment.center)),
              child: Text("2"),
            ),
            Container(
              child: Text("3"),
            ),
            Container(
              child: Text("4"),
            ),
            Container(
              child: Text("5"),
            ),
            Container(
              child: Text("6"),
            ),
            Container(
              child: Text("7"),
            ),
            Container(
              child: Text("8"),
            ),
            Container(
              child: Text("9"),
            ),
            Container(
              child: Text("10"),
            ),
          ],
        )
      ],
    );
  }
}

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 180,
          height: 45,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(20),
          child: Text("hello"),
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(12)),
        ),
        Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Text("dong 1"),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Text("dong 2"),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Text("dong 3"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class ControllerUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [Page1(), Page2(), Page3()],
          )
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 180,
            height: 45,
            child: Column(
              children: [
                Page1(),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/account1.jps",
                        width: 40,
                        height: 40,
                        color: Colors.black,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                        semanticLabel: "can not read now",
                        isAntiAlias: true,
                        alignment: Alignment.center,
                        cacheHeight: 40,
                        cacheWidth: 40,
                        scale: 10000.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Column(
              children: [
                Page1(),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/account1.jps",
                        width: 40,
                        height: 40,
                        color: Colors.black,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                        semanticLabel: "can not read now",
                        isAntiAlias: true,
                        alignment: Alignment.center,
                        cacheHeight: 40,
                        cacheWidth: 40,
                        scale: 10000.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Column(
              children: [
                Page1(),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/account1.jps",
                        width: 40,
                        height: 40,
                        color: Colors.black,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                        semanticLabel: "can not read now",
                        isAntiAlias: true,
                        alignment: Alignment.center,
                        cacheHeight: 40,
                        cacheWidth: 40,
                        scale: 10000.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Column(
              children: [
                Page1(),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/account1.jps",
                        width: 40,
                        height: 40,
                        color: Colors.black,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                        semanticLabel: "can not read now",
                        isAntiAlias: true,
                        alignment: Alignment.center,
                        cacheHeight: 40,
                        cacheWidth: 40,
                        scale: 10000.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Column(
              children: [
                Page1(),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/account1.jps",
                        width: 40,
                        height: 40,
                        color: Colors.black,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                        semanticLabel: "can not read now",
                        isAntiAlias: true,
                        alignment: Alignment.center,
                        cacheHeight: 40,
                        cacheWidth: 40,
                        scale: 10000.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Column(
              children: [
                Page1(),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/account1.jps",
                        width: 40,
                        height: 40,
                        color: Colors.black,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                        semanticLabel: "can not read now",
                        isAntiAlias: true,
                        alignment: Alignment.center,
                        cacheHeight: 40,
                        cacheWidth: 40,
                        scale: 10000.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Column(
              children: [
                Page1(),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/account1.jps",
                        width: 40,
                        height: 40,
                        color: Colors.black,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                        semanticLabel: "can not read now",
                        isAntiAlias: true,
                        alignment: Alignment.center,
                        cacheHeight: 40,
                        cacheWidth: 40,
                        scale: 10000.0,
                      )
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

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeSame = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Text(
                  "Test",
                  style: TextStyle(
                    height: 5000,
                    color: Colors.white,
                    fontSize: 150,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w500,
                    debugLabel: "debug line",
                    backgroundColor: Colors.orange,
                    letterSpacing: 500,
                    wordSpacing: 500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 45,
            child: Container(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Test",
                      style: TextStyle(
                        height: 5000,
                        color: Colors.white,
                        fontSize: 150,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w500,
                        debugLabel: "debug line",
                        backgroundColor: Colors.black,
                        letterSpacing: 500,
                        wordSpacing: 500,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              "Test",
                              style: TextStyle(
                                height: 5000,
                                color: Colors.white,
                                fontSize: 150,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w500,
                                debugLabel: "debug line",
                                backgroundColor: Colors.black,
                                letterSpacing: 500,
                                wordSpacing: 500,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Test",
                              style: TextStyle(
                                height: 5000,
                                color: Colors.white,
                                fontSize: 150,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w500,
                                debugLabel: "debug line",
                                backgroundColor: Colors.black,
                                letterSpacing: 500,
                                wordSpacing: 500,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Test",
                              style: TextStyle(
                                  height: 5000,
                                  color: Colors.white,
                                  fontSize: 120,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w500,
                                  debugLabel: "debug line",
                                  backgroundColor: Colors.black,
                                  letterSpacing: 500,
                                  wordSpacing: 500,
                                  inherit: true,
                                  fontStyle: FontStyle.italic,
                                  textBaseline: TextBaseline.alphabetic),
                            ),
                          ),
                          Column(
                            children: [
                              FlutterLogo(
                                style: FlutterLogoStyle.horizontal,
                                duration: Duration(seconds: 500),
                                size: 5000,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 40,
                                child: Wrap(
                                  children: [
                                    Container(
                                      width: (sizeSame - 40) / 5,
                                      child: Chip(
                                        label: Text("Mới"),
                                      ),
                                    ),
                                    Container(
                                      width: (sizeSame - 40) / 5,
                                      child: Chip(
                                        label: Text("Đồng"),
                                      ),
                                    ),
                                    Container(
                                      width: (sizeSame - 40) / 5,
                                      child: Chip(
                                        label: Text("Bạc"),
                                      ),
                                    ),
                                    Container(
                                      width: (sizeSame - 40) / 5,
                                      child: Chip(
                                        label: Text("Vàng"),
                                      ),
                                    ),
                                    Container(
                                      width: (sizeSame - 40) / 5,
                                      child: Chip(
                                        label: Text("Kim cương"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              Text("Bạn đã đạt hạng mới"),
                                              Text(
                                                  "Đổi quà không ảnh hưởng đến việc thăng hạng"),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Text(""),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            child: Text("Rewards"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Text("Thông tin tài khoản"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Text("Lịch sử"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Text("Đăng xuất"),
          ),
          Container(
            width: 180,
            height: 45,
          ),
          Container(
            width: 180,
            height: 45,
          ),
          Container(
            width: 180,
            height: 45,
          ),
          Container(
            width: 180,
            height: 45,
          ),
          Container(
            width: 180,
            height: 45,
          ),
        ],
      ),
    );
  }
}
