import 'package:demo2/pages/write.dart';
import 'package:flutter/material.dart';
import 'package:demo2/model/detailsModel.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

const String mainBox = "mainBox";

class LocalPage extends StatelessWidget {
  const LocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: Hive.box<detailsModel>(mainBox).listenable(),
          builder: (context, Box<detailsModel> box, _) {
            if (box.values.isEmpty) {
              return const Center(
                child: Text("无数据"),
              );
            }
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                detailsModel? currentContact = box.getAt(index);
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                              "你确定要删除 ${currentContact.title}吗?",
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("No"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              TextButton(
                                child: const Text("Yes"),
                                onPressed: () async {
                                  await box.deleteAt(index);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 5),
                          Text(currentContact!.title),
                          const SizedBox(height: 5),
                          Text(currentContact.writes.length > 20
                              ? '${currentContact.writes.substring(0, 20)}....'
                              : currentContact.writes),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                context.goNamed('write');
              },
            );
          },
        ),
      ),
    );
  }
}
