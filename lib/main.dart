import 'package:expense_trackerv2/models/transaction.dart';
import 'package:expense_trackerv2/providers/transactionProvider.dart';
import 'package:expense_trackerv2/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('transactionBox');
  Hive.registerAdapter(TransactionAdapter());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TransactionProvider(),
    ),],
      child: const MaterialApp(
      home: HomeScreen(),
      ),
    ));
}

