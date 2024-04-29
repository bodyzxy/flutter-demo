// import 'package:demo2/router/router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

//文章详情
@HiveType(typeId: 0)
// ignore: camel_case_types
class detailsModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String writes;

  detailsModel(this.title, this.writes);
}
