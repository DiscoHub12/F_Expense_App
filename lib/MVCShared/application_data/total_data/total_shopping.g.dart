// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_shopping.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TotalShoppingAdapter extends TypeAdapter<TotalShopping> {
  @override
  final int typeId = 2;

  @override
  TotalShopping read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalShopping(
      fields[0] as String,
      fields[1] as String,
      (fields[2] as List).cast<DataShopping>(),
    );
  }

  @override
  void write(BinaryWriter writer, TotalShopping obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameTotalShopping)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.elementInside);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalShoppingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
