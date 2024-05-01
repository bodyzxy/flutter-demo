import 'package:demo2/model/detailsModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String mainBox = "mainBox";

class CardPage extends StatefulWidget {
  const CardPage({super.key});
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<Widget> _initCardWord() {
    final Box<detailsModel> detailModel = Hive.box<detailsModel>(mainBox);
    var templast = detailModel.values.map((detailsModel card) {
      return InkWell(
        onTap: () {
          final encodedTitle = Uri.encodeComponent(card.title);
          final encodedWrites = Uri.encodeComponent(card.writes);
          context.go('/details/$encodedTitle/$encodedWrites');
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
                child: Image.asset("./lib/images/2.png", fit: BoxFit.cover),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("./lib/images/2.png"),
                ),
                title: Text(card.title),
                subtitle: Text(card.writes.length > 10
                    ? '${card.writes.substring(0, 10)}....'
                    : card.writes),
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
