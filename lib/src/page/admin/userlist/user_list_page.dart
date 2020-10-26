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
        title: Text("Quản lý user"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              10,
              (index) => Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text("username ${index + 1}"),
                            centerTitle: true,
                          ),
                          body: Center(child: Text("index $index")),
                        )));
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        child: ListTile(
                          leading: Icon(Icons.circle, size: 50,),
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
