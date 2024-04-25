import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.green))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: '标题'),
                style: TextStyle(fontSize: 20.0),
              ),
            )),
        Container(
          height: 30,
          width: double.infinity,
          // color: Colors.blue,
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: Colors.green))),
          child: ListView(
            scrollDirection: Axis.horizontal, //横向滚动
            children: [
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.add),
              ),
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.add_a_photo),
              ),
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.add_box),
              ),
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.add_link),
              ),
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.add_reaction),
              ),
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.attach_email),
              ),
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.audio_file),
              ),
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.autorenew),
              ),
              Container(
                height: 40,
                width: 50,
                child: const Icon(Icons.auto_delete),
              ),
            ],
          ),
        ), //组件
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null, // 允许文本字段根据输入的行数自动增加高度
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: '内容'),
            ),
          ), //文本输入区域
        ), //文本区域
        Container(
          height: 60,
          width: double.infinity,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CupertinoButton.filled(
                  child: const Text("发布"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          width: double.infinity,
          color: Colors.black,
        ),
      ],
    );
  }
}
