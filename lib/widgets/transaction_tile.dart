import 'package:expense_tracker_v2/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  int? index;
  IconData? icon;
  double? width;
  Transaction? transaction;
  TransactionTile({
    super.key,
    this.transaction,
    required this.icon,
    this.width = double.infinity,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF291e60),
          radius: 25,
          child: Text(transaction!.biller!.substring(0,1), style: const TextStyle(color: Colors.white),),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction?.biller ?? "Unknown Biller",
              style: const TextStyle(color: Color(0xFF291e60)),
            ),
            const SizedBox(height: 10),
            Text(
              transaction?.date != null
                  ? DateFormat('dd/MM/yyyy').format(transaction!.date!)
                  : "No Date",
              style: const TextStyle(color: Color(0xFF291e60)),
            ),
          ],
        ),
        trailing: Text(
          "₦${transaction?.amount ?? '0.00'}",
          style: const TextStyle(color: Color(0xFF291e60), fontSize: 20),
          ),
      ),
    );
  }
}
