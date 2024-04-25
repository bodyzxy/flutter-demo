import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../res/list_image.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<Widget> _initCardWord() {
    var templast = images.map((v) {
      return InkWell(
        onTap: () {
          context.goNamed("details");
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 20,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 17 / 9,
                child: Image.asset(v["image"], fit: BoxFit.cover),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(v["image"]),
                ),
                title: Text(v["name"]),
                subtitle: Text(v["auther"]),
              ),
            ],
          ),
        ),
      );
    });
    return templast.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: _initCardWord());
  }
}
