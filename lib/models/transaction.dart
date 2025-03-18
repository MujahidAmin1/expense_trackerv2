import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject{
  @HiveField(0)
  String? biller;
  @HiveField(1)
  String? billerDetail;
 @HiveField(2)
  DateTime? date;
  @HiveField(3)
  bool? isExpense;
  @HiveField(4)
  double? amount;

  Transaction({required this.biller, required this.billerDetail, required this.date, this.isExpense, required this.amount});
}

@HiveType(typeId: 1)
class Credit extends HiveObject {
  @HiveField(0)
  String? holderName;
  @HiveField(1)
  double? balance = 0.0;
  @HiveField(2)
  String? cardNumber;
  @HiveField(3)
  String? expDate;
  @HiveField(4)
  String? cvv;
  Credit({this.holderName, this.cardNumber, this.expDate, this.balance = 0.0,this.cvv});
}