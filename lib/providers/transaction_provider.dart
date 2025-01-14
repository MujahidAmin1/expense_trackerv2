import 'package:expensetrackerv2/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TransactionProvider extends ChangeNotifier{
  Transaction? transaction;
  late Box<Transaction> _transactionBox;
  List<Transaction> _transactionList = [];
  List<Transaction> get transactionList => _transactionList;
  List<Transaction> sortedTransactions = [];
  double? sumAmounts;
  
   TransactionProvider() {
    initializeDB();
  }
  Future<void> initializeDB()async{
    await Hive.initFlutter();
   _transactionBox = await Hive.openBox('transactionBox');
   _transactionList = _transactionBox.values.toList();
   sortedTransactions.addAll(transactionList);
   
   notifyListeners();
  }
  Future<void> addTransact(Transaction transaction)async{
    await _transactionBox.add(transaction);
    _transactionList.add(transaction);
    updateSortedTransactions();
    notifyListeners();
  }
  Future<void> editTransact(int index, Transaction transaction)async{
    await _transactionBox.putAt(index, transaction);
    _transactionList[index] = transaction;
    updateSortedTransactions();
    notifyListeners();
  }
  Future<void> deleteTransact(int index)async{
    await _transactionBox.deleteAt(index);
    _transactionList.removeAt(index);
    updateSortedTransactions();
    
    notifyListeners();
  }
 void sort(List<Transaction> sort){
  sortedTransactions = sort;
  notifyListeners();
 }
 // Helper method to update sortedTransactions based on _transactionList
  void updateSortedTransactions() {
    sortedTransactions = List.from(_transactionList);
    notifyListeners();
  }
  
}