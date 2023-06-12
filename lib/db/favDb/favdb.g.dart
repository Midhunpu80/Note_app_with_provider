// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favdb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class fdbAdapter extends TypeAdapter<fdb> {
  @override
  final int typeId = 2;

  @override
  fdb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return fdb(
      name: fields[0] as String?,
      subtitle: fields[1] as String?,
      imges: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, fdb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.imges);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is fdbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
