import 'package:expense_tracker_v2/providers/button_control.dart';
import 'package:expense_tracker_v2/providers/navbar_provider.dart';
import 'package:expense_tracker_v2/providers/onboarding_provider.dart';
import 'package:expense_tracker_v2/providers/transaction_provider.dart';
import 'package:expense_tracker_v2/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'models/transaction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(CreditAdapter());
  final transactionProvider = TransactionProvider();
  await transactionProvider.initializeDB();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TransactionProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ButtonControl(),
      ),
      ChangeNotifierProvider(
        create: (_) => NavBarProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => OnBoardingProvider(),
      ),
    ],
    child: MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF291e60),
          )),
      home: const OnBoarding(),
    ),
  ));
}
