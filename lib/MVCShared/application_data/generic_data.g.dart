// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataGenericAdapter extends TypeAdapter<DataGeneric> {
  @override
  final int typeId = 6;

  @override
  DataGeneric read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataGeneric(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataGeneric obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataGenericAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
