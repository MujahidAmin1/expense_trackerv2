import 'package:expensetrackerv2/models/transaction.dart';
import 'package:expensetrackerv2/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatefulWidget {
  Transaction? transaction;
  CreditCard({super.key, this.transaction});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context){
    var transactionProvider = Provider.of<TransactionProvider>(context);
    return Card(
      color: const Color(0xFF291e60),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40)
        ),
        height: 213,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 'datum',
                style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              Text("Balance", style: TextStyle(fontSize: 17, color: Colors.white),),
             SizedBox(height: 70),
              Row(
                children: [
                  Text("4034 3344 2445 2234", style: TextStyle(fontSize: 24, color: Colors.white),),
                  const SizedBox(width: 80),
                  SizedBox(
                    height: 26,
                    child: Image.asset('assets/mcard.png'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}