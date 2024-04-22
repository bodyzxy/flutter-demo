import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  Widget child;
  HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.yellow,
          ),
          Container(
            height: 60,
            width: double.infinity,
            // color: Colors.red,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            child: ListView(
              scrollDirection: Axis.horizontal, //设置成横向滚动
              children: [
                Container(
                  height: 60,
                  width: 100,
                  color: Colors.blue,
                  alignment: Alignment.center, //文字剧中
                  child: ListTile(
                    title: const Text(
                      "首页",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  height: 60,
                  width: 100,
                  color: Colors.blue,
                  alignment: Alignment.center, //文字剧中
                  child: ListTile(
                    title: const Text(
                      "卡片",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onTap: () {
                      context.goNamed("card");
                    },
                  ),
                ),
                Container(
                  height: 60,
                  width: 100,
                  color: Colors.blue,
                  alignment: Alignment.center, //文字剧中
                  child: ListTile(
                    title: const Text(
                      "本地",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onTap: () {
                      context.goNamed("local");
                    },
                  ),
                ),
                Container(
                  height: 60,
                  width: 100,
                  color: Colors.blue,
                  alignment: Alignment.center, //文字剧中
                  child: ListTile(
                    title: const Text(
                      "创作",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onTap: () {
                      context.goNamed("write");
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: widget.child,
            ),
          )
        ],
      ),
    );
  }
}
