// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

  @override
  @override
Transaction read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return Transaction(
    biller: fields[0] as String?,
    billerDetail: fields[1] as String?,
    date: fields[2] as DateTime?,
    isExpense: fields[3] as bool?,
    amount: _parseDouble(fields[4]),
  );
}

double? _parseDouble(dynamic value) {
  if (value is String) {
    return double.tryParse(value);  // Safely parse string to double if it's a String
  } else if (value is double) {
    return value;  // Return as-is if it's already a double
  }
  return null;  // Return null if the value is neither String nor double
}

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.biller)
      ..writeByte(1)
      ..write(obj.billerDetail)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.isExpense)
      ..writeByte(4)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
