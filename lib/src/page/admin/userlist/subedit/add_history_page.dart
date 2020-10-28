import 'package:flutter/material.dart';

class AddHistoryPage extends StatefulWidget {
  @override
  _AddHistoryPageState createState() => _AddHistoryPageState();
}

class _AddHistoryPageState extends State<AddHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0EFF4),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          "Thêm lịch sử user",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Thêm lịch sử"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("usernaem aaa"),
                          TextField(
                            decoration:
                                InputDecoration(hintText: "tuyến đường đi"),
                          ),
                          Container(
                              width: double.infinity,
                              child: Center(
                                  child: FlatButton(
                                    color: Colors.orange,
                                      onPressed: () {},
                                      child: Text("Thêm lịch sử", style: TextStyle(color: Colors.white),))))
                        ],
                      ),
                    );
                  });
            },
            color: Colors.orange,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(5, (index) {
            return ListTile(
              title: Text("Nguyễn Văn $index"),
              subtitle: Text("Tuyến Cần Thơ - Cà Mau - $index"),
            );
          }),
        ),
      ),
    );
  }
}
