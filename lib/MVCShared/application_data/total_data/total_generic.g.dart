// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_generic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TotalGenericAdapter extends TypeAdapter<TotalGeneric> {
  @override
  final int typeId = 3;

  @override
  TotalGeneric read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalGeneric(
      fields[0] as String,
      fields[1] as String,
      (fields[2] as List).cast<DataGeneric>(),
    );
  }

  @override
  void write(BinaryWriter writer, TotalGeneric obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameTotalGeneric)
      ..writeByte(1)
      ..write(obj.dataCreationTotalGeneric)
      ..writeByte(2)
      ..write(obj.dataGenericInside);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalGenericAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
