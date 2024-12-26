import 'package:expense_trackerv2/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TransactionProvider extends ChangeNotifier{
  late Box<Transaction> _transactionBox;
  List<Transaction> _transactionList = [];
  List<Transaction> get transactionList => _transactionList;

  Future<void> initializeDB()async{
    await Hive.initFlutter();
   _transactionBox = await Hive.openBox('transactionBox');
   _transactionList = _transactionBox.values.toList();
   notifyListeners();
  }
  Future<void> addTransact(Transaction transaction)async{
    await _transactionBox.add(transaction);
    _transactionList.add(transaction);
    notifyListeners();
  }
  Future<void> editTransact(int index, Transaction transaction)async{
    await _transactionBox.putAt(index, transaction);
    _transactionList[index] = transaction;
    notifyListeners();
  }
  Future<void> deleteTransact(int index)async{
    await _transactionBox.deleteAt(index);
    _transactionList.removeAt(index);
    notifyListeners();
  }
}