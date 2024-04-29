import 'package:demo2/model/adapter/detailsPageAdapter.dart';
import 'package:demo2/model/detailsModel.dart';
import 'package:demo2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

const String mainBox = "mainBox";

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<detailsModel>(detailsPageAdapter());
  await Hive.openBox<detailsModel>(mainBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: '初见',
      theme: ThemeData(primarySwatch: Colors.red),
      routerConfig: router,
    );
  }
}
