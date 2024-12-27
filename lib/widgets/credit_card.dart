import 'package:expense_trackerv2/models/transaction.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  Transaction? transaction;
  CreditCard({super.key, this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 75, 75, 75),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40)
        ),
        height: 200,
        child: const Padding(
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
                  SizedBox(width: 90),
                  Icon(Icons.abc_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}