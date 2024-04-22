import 'package:demo2/router/router.dart';
import 'package:flutter/material.dart';

void main() {
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
