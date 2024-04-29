import 'package:demo2/model/adapter/detailsPageAdapter.dart';
import 'package:demo2/model/detailsModel.dart';
import 'package:demo2/pages/card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("xxxxxxxxxx"),
      ),
    );
  }
}
