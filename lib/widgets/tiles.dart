import 'package:expense_trackerv2/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTiles extends StatelessWidget {
  int? index;
  IconData? icon;
  double? width;
  Transaction? transaction;
  CustomTiles(
      {super.key,
      this.transaction,
      required this.icon,
      this.width = double.infinity,
      this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color.fromRGBO(33, 150, 243, 1),
      child: ListTile(
        leading: CircleAvatar(
          radius: 7,
          child: Icon(icon),
        ),
        title: Column(
          children: [
            Text(transaction?.biller ?? "Unknown Biller"),
            const SizedBox(height: 30),
            Text(transaction?.date != null
                ? DateFormat('dd/MM/yyyy').format(transaction!.date!)
                : "No Date"),
          ],
        ),
        trailing: Text("\$${transaction?.amount ?? "0.00"}"),
      ),
    );
  }
}
