// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataExpenseAdapter extends TypeAdapter<DataExpense> {
  @override
  final int typeId = 4;

  @override
  DataExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataExpense(
      fields[0] as String,
      fields[1] as double,
    )..checked = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, DataExpense obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.checked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
