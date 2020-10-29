import 'package:cart_rent/src/model/CarModel.dart';
import 'package:cart_rent/src/page/admin/addcar/add_car_page.dart';
import 'package:cart_rent/src/page/admin/addcategory/add_news_page.dart';
import 'package:cart_rent/src/page/admin/userlist/user_list_page.dart';
import 'package:cart_rent/src/page/carorder/car_order_page.dart';
import 'package:cart_rent/src/page/detail/detail_page.dart';
import 'package:cart_rent/src/page/store/store_page.dart';
import 'package:cart_rent/src/page/account/account_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndexBottomBar = 0;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Map<String, List<CarInfo>> mapCarInfo = {};
  bool isEnableShimmer = true;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    fetchCarByCategory();
  }

  void changeCurrentIndex({int indexChange}) {
    setState(() {
      _currentIndexBottomBar = indexChange;
    });
  }

  fetchCarByCategory() {
    mapCarInfo = {};
    firebaseFirestore.collection("car_rent").get().then((value) {
      if (value.docs.length > 0) {
        print("fetch car by category is loaded");
        value.docs.forEach((element) {
          var catName = (element.id).split("-");
          if (catName[0] == "cat") {
            var data = element.data();
            if (mapCarInfo.containsKey(catName[1])) {
              setState(() {
                mapCarInfo[catName[1]].add(CarInfo(title: data['title'], image: data['image'], body: data['body']));
              });
            } else {
              setState(() {
                mapCarInfo.addAll({
                  catName[1]: [CarInfo(title: data['title'], image: data['image'], body: data['body'])]
                });
              });
            }
          }
        });
      }
    });
  }

  var indexTest = 0;
  bool flagRunIndexChange = true;

  @override
  Widget build(BuildContext context) {
    final indexArgs = ModalRoute.of(context).settings.arguments;

    if (indexArgs == 1 && flagRunIndexChange == true) {
      setState(() {
        _currentIndexBottomBar = indexArgs;
        flagRunIndexChange = false;
      });
    }

    List<Widget> contentBody = [AddCategoryNewsPage(), AddCarPage(), StorePage(), UserListPage()];

    // List<Widget> contentBody = [
    //   homeBody(context),
    //   CarOrder(),
    //   StorePage(),
    //   AccountPage()
    // ];

    return Scaffold(
      backgroundColor: Color(0xffF0EFF4),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Danh mục"),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: "Xe"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Cửa hàng"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Admin"),

          // BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.directions_car), label: "Đặt xe"),
          // BottomNavigationBarItem(icon: Icon(Icons.store), label: "Cửa hàng"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.account_circle), label: "Tài khoản"),
        ],
        currentIndex: _currentIndexBottomBar,
        selectedItemColor: Color(0xffEE7F23),
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndexBottomBar = index;
          });
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await fetchCarByCategory();
        },
        child: contentBody[_currentIndexBottomBar],
      ),
    );
  }

  Widget homeBody(BuildContext context) {
    Widget _categoryOne({String image, String title, String description}) {
      //fix for length of description not enought 3 lines
      var des = description;

      if (des.length < 30) {
        des += "\n\n";
      }

      if (des.length < 50) {
        des += "\n";
      }

      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        title: title,
                        image: image,
                        description: description,
                      )));
        },
        child: Container(
            margin: EdgeInsets.only(left: 15, top: 3, bottom: 2),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)]),
            width: 250,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    height: 150,
                    width: 250,
                    isAntiAlias: true,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    colorBlendMode: BlendMode.darken,
                    semanticLabel: "what the duck",
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.center,
                    repeat: ImageRepeat.noRepeat,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        des,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(wordSpacing: 3),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      OutlineButton(
                        borderSide: BorderSide(color: Color(0xffF2B248)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        onPressed: () {
                          // Navigator.pushNamed(context, DetailPage.route, );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        title: title,
                                        image: image,
                                        description: description,
                                      )));
                        },
                        child: Text(
                          "Chi tiết xe",
                          style: TextStyle(color: Color(0xffF2B248)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      );
    }

    String name = "";
    String profileImageUrl = "";

    if (firebaseAuth.currentUser != null && firebaseAuth.currentUser.photoURL != null) {
      profileImageUrl = firebaseAuth.currentUser.photoURL;
    }

    if (firebaseAuth.currentUser != null && firebaseAuth.currentUser.displayName != null) {
      name = firebaseAuth.currentUser.displayName.split("%")[0];
    } else if (firebaseAuth.currentUser != null && firebaseAuth.currentUser.email != null) {
      name = firebaseAuth.currentUser.email;
    } else {
      name = "Chưa đăng nhập";
    }
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          SafeArea(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: profileImageUrl == ""
                        ? Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/images/account1.jpg"), fit: BoxFit.fill)),
                          )
                        : Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.all(5),
                            decoration:
                                BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: NetworkImage(profileImageUrl), fit: BoxFit.fill)),
                          ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text("Khách hàng mới | ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              )),
                          Icon(
                            Icons.stars,
                            color: Colors.yellow,
                            size: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.notifications,
                                color: Colors.grey,
                              )),
                          onTap: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          MediaQuery.of(context).size.width <= 320
              ? Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndexBottomBar = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/score.PNG",
                              width: 62,
                              height: 62,
                            ),
                            Text(
                              "Tích điểm",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndexBottomBar = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/car.png",
                              width: 62,
                              height: 62,
                            ),
                            Text(
                              "Thuê xe",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndexBottomBar = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/coupon.PNG",
                              width: 62,
                              height: 62,
                            ),
                            Text(
                              "Coupon",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndexBottomBar = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/rewards.PNG",
                              width: 62,
                              height: 62,
                            ),
                            Text(
                              "Rewads",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndexBottomBar = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset("assets/images/score.PNG", width: 69, height: 69),
                            Text(
                              "Tích điểm",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndexBottomBar = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/car.png",
                              width: 69,
                              height: 69,
                            ),
                            Text(
                              "Thuê xe",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndexBottomBar = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/coupon.PNG",
                              width: 69,
                              height: 69,
                            ),
                            Text(
                              "Coupon",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndexBottomBar = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/rewards.PNG",
                              width: 69,
                              height: 69,
                            ),
                            Text(
                              "Rewads",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

          // RENDER CATEGORY AND CAR BELONG TO CATEGORY
          ...(mapCarInfo.keys).map((e) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text(e, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(right: 15),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...mapCarInfo[e].map((e) {
                          return _categoryOne(image: e.image, title: e.title, description: e.body);
                        }).toList()
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
