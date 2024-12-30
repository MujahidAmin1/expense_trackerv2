import 'package:expense_trackerv2/models/transaction.dart';
import 'package:expense_trackerv2/providers/button_control.dart';
import 'package:expense_trackerv2/providers/navbar_provider.dart';
import 'package:expense_trackerv2/providers/transaction_provider.dart';
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
    ),
    ChangeNotifierProvider(
      create: (_) => ButtonControl(),
      ),
      ChangeNotifierProvider(create: (_) => NavBarProvider(),
      )
    ],
      child: const MaterialApp(
      home: HomeScreen(),
      ),
    ));
}

