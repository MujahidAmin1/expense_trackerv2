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