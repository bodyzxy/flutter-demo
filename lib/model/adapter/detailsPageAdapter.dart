// ignore: file_names
import 'package:demo2/model/detailsModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class detailsPageAdapter extends TypeAdapter<detailsModel> {
  @override
  final typeId = 0;

  @override
  detailsModel read(BinaryReader reader) {
    var numbers = reader.readByte();
    var files = <int, dynamic>{
      for (var i = 0; i < numbers; i++) reader.readByte(): reader.read(),
    };
    return detailsModel(
      files[0] as String,
      files[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, detailsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.writes);
  }
}
