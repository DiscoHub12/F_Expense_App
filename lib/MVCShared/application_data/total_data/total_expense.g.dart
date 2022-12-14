// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_expense.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TotalExpenseAdapter extends TypeAdapter<TotalExpense> {
  @override
  final int typeId = 1;

  @override
  TotalExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalExpense(
      fields[0] as String,
      fields[1] as String,
      (fields[2] as List).cast<DataExpense>(),
    );
  }

  @override
  void write(BinaryWriter writer, TotalExpense obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameTotalExpense)
      ..writeByte(1)
      ..write(obj.dateCreationTotalExpense)
      ..writeByte(2)
      ..write(obj.dateExpenseInside);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
