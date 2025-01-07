import 'package:expense_trackerv2/models/transaction.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  Transaction? transaction;
  CreditCard({super.key, this.transaction});

  @override
  Widget build(BuildContext context){
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
              Text("\$10000", style: TextStyle(fontSize: 30, color: Colors.white),),
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
    );;
  }
}