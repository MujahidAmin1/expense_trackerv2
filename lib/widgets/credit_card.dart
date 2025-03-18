import 'package:expense_tracker_v2/models/transaction.dart';
import 'package:expense_tracker_v2/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatefulWidget {
  Credit? credit;
  CreditCard({super.key, this.credit});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
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
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 '${widget.credit!.balance}',
                style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
             const SizedBox(height: 80),
              Row(
                children: [
                  Text(
                    '${widget.credit!.cardNumber}',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  const SizedBox(width: 120),
                  SizedBox(
                    height: 26,
                    child: Image.asset('assets/mcard.png'),
                    ),
                ],
              ),
              Text(
                widget.credit!.holderName!.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}