import 'package:expense_trackerv2/models/transaction.dart';
import 'package:expense_trackerv2/providers/button_control.dart';
import 'package:expense_trackerv2/widgets/segment_btns.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SegmentTiles extends StatelessWidget {
  IconData? icon;
  double? width;
  Transaction? transaction;
  SegmentTiles({super.key, this.transaction, required this.icon, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    var sbtnController = Provider.of<ButtonControl>(context);
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
              elevation: isExpenseSelected ? 2 : 0,
              color: isExpenseSelected 
                      ? Colors.grey
                      : Colors.white,
              child: SegmentBtn(
                icon: Icons.arrow_upward, 
                topTxt: '20%', 
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
              elevation: isExpenseSelected ? 0 : 2,
              color: isExpenseSelected 
                      ? Colors.white
                      : Colors.grey,
              child: SegmentBtn(
                icon: Icons.arrow_downward, 
                topTxt: '80%', 
                bottomTxt: 'Income',
                ),
            ),
          ),
        ),
      ],
    );
  }
}