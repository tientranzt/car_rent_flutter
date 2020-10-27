import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  static const String route = "user_list_page";

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Quản lý user",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              10,
              (index) => Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scaffold(
                                      appBar: AppBar(
                                        backgroundColor: Colors.white,
                                        title: Text(
                                          "username $index",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        centerTitle: true,
                                        elevation: 0,
                                        iconTheme:
                                            IconThemeData(color: Colors.black),
                                      ),
                                      body:
                                          Center(child: Text("content $index")),
                                    )));
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        child: ListTile(
                          leading: Icon(
                            Icons.circle,
                            size: 50,
                            color: Colors.orange,
                          ),
                          title: Text("username ${index + 1}"),
                          subtitle: Text("email${index + 1}@gmail.com"),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
