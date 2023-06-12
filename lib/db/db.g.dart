// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class dbAdapter extends TypeAdapter<db> {
  @override
  final int typeId = 1;

  @override
  db read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return db(
      title: fields[0] as String?,
      sub: fields[1] as String?,
      img: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, db obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.sub)
      ..writeByte(2)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is dbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
