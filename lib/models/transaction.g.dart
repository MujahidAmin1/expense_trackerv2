// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

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
      amount: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(5)
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

class CreditAdapter extends TypeAdapter<Credit> {
  @override
  final int typeId = 1;

  @override
  Credit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Credit(
      holderName: fields[0] as String?,
      cardNumber: fields[2] as String?,
      expDate: fields[3] as String?,
      balance: fields[1] as double?,
      cvv: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Credit obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.holderName)
      ..writeByte(1)
      ..write(obj.balance)
      ..writeByte(2)
      ..write(obj.cardNumber)
      ..writeByte(3)
      ..write(obj.expDate)
      ..writeByte(4)
      ..write(obj.cvv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
