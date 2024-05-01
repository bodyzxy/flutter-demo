import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String writes;
  const DetailsPage({super.key, required this.title, required this.writes});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("./lib/images/2.png"),
          fit: BoxFit.cover, //覆盖整个容器
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // 设置Scaffold背景透明
        appBar: AppBar(
          backgroundColor: Colors.transparent, // 设置AppBar背景透明
          elevation: 0, // 去掉阴影
          title: Text(
            title,
            style: GoogleFonts.acme(
              fontSize: 50,
            ),
          ),
        ),
        body: Column(
          children: [
            Text(
              writes,
              style: GoogleFonts.abel(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
