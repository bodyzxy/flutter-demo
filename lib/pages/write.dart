import 'package:demo2/model/detailsModel.dart';
import 'package:demo2/pages/local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

const String mainBox = "mainBox";

class WritePage extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  late String title;
  late String write;

  void onFormsubmit() {
    // if (widget.formKey.currentState!.validate()) {
    Box<detailsModel> detailBox = Hive.box<detailsModel>(mainBox);
    detailBox.add(detailsModel(title, write));
    context.goNamed('local');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.green))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: '标题'),
                style: const TextStyle(fontSize: 20.0),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null, // 允许文本字段根据输入的行数自动增加高度
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: '内容'),
              onChanged: (value) {
                setState(() {
                  write = value;
                });
              },
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
                  onPressed: onFormsubmit,
                  child: const Text("发布"),
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
