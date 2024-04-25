import 'package:flutter/material.dart';
import '../config/sql.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var db = MySQL();
  var name = '';

  void _getSQLdata() async {
    try {
      var coon = await db.getConnection();
      print(
          '${await coon.query("SELECT name FROM flutter.user")}'); //////多次查询才可显示数据
      var results = await coon.query("SELECT name FROM flutter.user");
      if (results.isNotEmpty) {
        for (var row in results) {
          setState(() {
            name = row[0];
          });
        }
        coon.close();
      } else {
        print("object");
      }
    } catch (e) {
      print("error: ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("sssssss"),
      // ),
      body: Text('$name'),
      floatingActionButton: FloatingActionButton(
        onPressed: _getSQLdata,
        tooltip: 'Load Data',
        child: const Icon(Icons.download),
      ),
    );
  }
}
