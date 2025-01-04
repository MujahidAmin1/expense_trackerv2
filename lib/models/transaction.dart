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
  int?  balance;
  @HiveField(5)
  String? amount;

  Transaction({required this.biller, required this.billerDetail, required this.date, this.isExpense, this.balance, required this.amount});
}