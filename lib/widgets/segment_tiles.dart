import 'package:expense_trackerv2/models/transaction.dart';
import 'package:expense_trackerv2/providers/button_control.dart';
import 'package:expense_trackerv2/widgets/segment_btns.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';

class SegmentTiles extends StatelessWidget {
  IconData? icon;
  double? width;
  Transaction? transaction;
  SegmentTiles({super.key, this.transaction, this.icon, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    var sbtnController = Provider.of<ButtonControl>(context);
    var transactionProvider = Provider.of<TransactionProvider>(context);
    bool isExpenseSelected = sbtnController.isExpense!;
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              !isExpenseSelected 
              ? sbtnController.toggle(true)
              : null;
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: isExpenseSelected ? 1 : 0,
              color: isExpenseSelected 
                      ? Color(0xFFDCFFEB)
                      : Colors.white,
              child: SegmentBtn(
                icon: Icons.arrow_upward, 
                topTxt: 
                       "${(transactionProvider.sortedTransactions.where((element) => element.isExpense!).length / transactionProvider.transactionList.length) * 100}%".substring(0,5),
                        
                bottomTxt: 'Expense',
                ),
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: GestureDetector(
            onTap: (){
              isExpenseSelected 
              ? sbtnController.toggle(false)
              : null;
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: isExpenseSelected ? 0 : 1,
              color: isExpenseSelected 
                      ? Colors.white
                      : Color(0xFFDCFFEB),
              child: SegmentBtn(
                icon: Icons.arrow_downward, 
                topTxt: "${(transactionProvider.sortedTransactions.where((element) => element.isExpense == false).length / transactionProvider.transactionList.length) * 100}%".substring(0,5), 
                bottomTxt: 'Income',
                ),
            ),
          ),
        ),
      ],
    );
  }
}