import 'package:expense_tracker_v2/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TransactionProvider extends ChangeNotifier {
  Transaction? transaction;
  Credit? creditCard;
  late Box<Transaction> _transactionBox;
  late Box<Credit> _creditBox;
  Box<Credit> get creditBox => _creditBox;
  List<Transaction> _transactionList = [];
  List<Transaction> get transactionList => _transactionList;
  List<Transaction> sortedTransactions = [];
  double? sumAmounts;

  TransactionProvider() {
    initializeDB();
  }

  Future<void> initializeDB() async {
    await Hive.initFlutter();
    _transactionBox = await Hive.openBox('transactionBox');
    _creditBox = await Hive.openBox('creditBox');
    creditCard = _creditBox.get('card');
    _transactionList = _transactionBox.values.toList();
    sortedTransactions.addAll(transactionList);

    notifyListeners();
  }

  Future<void> addTransact(Transaction transaction) async {
    await _transactionBox.add(transaction);
    _transactionList.add(transaction);

    await updateBalance(
        changeAmount: transaction.amount,
        isExpense: transaction.isExpense ?? true);
    updateSortedTransactions();
    notifyListeners();
  }

  Future<void> editTransact(int index, Transaction transaction) async {
    Transaction oldTransaction = _transactionList[index];

    await updateBalance(
        changeAmount: oldTransaction.amount,
        isExpense: !oldTransaction.isExpense!);

    await _transactionBox.putAt(index, transaction);
    _transactionList[index] = transaction;
    updateSortedTransactions();

    await updateBalance(
        changeAmount: transaction.amount,
        isExpense: transaction.isExpense ?? true);
  }

  Future<void> deleteTransact(int index) async {
    Transaction deletedTransaction = _transactionList[index];

    await updateBalance(
        changeAmount: deletedTransaction.amount,
        isExpense: !deletedTransaction.isExpense!);

    await _transactionBox.deleteAt(index);
    _transactionList.removeAt(index);
    updateSortedTransactions();
  }

  Future<void> deleteAll() async {
    await _transactionBox.deleteAll(transactionList);
    notifyListeners();
  }

  void sort(List<Transaction> sort) {
    sortedTransactions = sort;
    notifyListeners();
  }

  // Helper method to update sortedTransactions based on _transactionList
  void updateSortedTransactions() {
    sortedTransactions = List.from(_transactionList);
    notifyListeners();
  }

  Future<void> createCard(Credit creditCard) async {
    await _creditBox.put('card', creditCard);
    this.creditCard = creditCard;
    notifyListeners();
  }

  Future<void> deleteCard() async {
    await _creditBox.delete('card');
    notifyListeners();
  }

  Future<void> updateBalance(
      {double? changeAmount, bool isExpense = true}) async {
    if (creditCard == null || changeAmount == null) return;

    // Adjust balance based on the transaction type (expense or income)
    if (isExpense) {
      creditCard!.balance = (creditCard!.balance ?? 0.0) - changeAmount;
    } else {
      creditCard!.balance = (creditCard!.balance ?? 0.0) + changeAmount;
    }

    // Save the updated balance in Hive
    await _creditBox.put('card', creditCard!);
    notifyListeners();
  }
}
