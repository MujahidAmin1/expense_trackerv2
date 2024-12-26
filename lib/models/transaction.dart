import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? date;
  @HiveField(2)
  bool? isExpense;
  @HiveField(3)
  bool? isIncome;
  @HiveField(4)
  double? amount;

  Transaction({required this.name, required this.date, this.isExpense, this.isIncome, required this.amount});
}