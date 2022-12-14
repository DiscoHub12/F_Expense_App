// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataShoppingAdapter extends TypeAdapter<DataShopping> {
  @override
  final int typeId = 5;

  @override
  DataShopping read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataShopping(
      fields[0] as String,
    )
      ..checked = fields[1] as bool
      ..quantity = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, DataShopping obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameElement)
      ..writeByte(1)
      ..write(obj.checked)
      ..writeByte(2)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataShoppingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
