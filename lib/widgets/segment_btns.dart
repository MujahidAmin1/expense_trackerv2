import 'package:expense_tracker_v2/providers/button_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SegmentBtn extends StatelessWidget {
  IconData? icon;
  String? topTxt;
  String? bottomTxt;
  SegmentBtn(
      {super.key,
      this.icon,
      this.topTxt,
      this.bottomTxt,
      });

  @override
  Widget build(BuildContext context) {
    var sbtnController = Provider.of<ButtonControl>(context);
    return Container(
      height: 70,
      child: Row(
        children: [
          const SizedBox(width: 15),
          CircleAvatar(
            backgroundColor: bottomTxt == "Expense"
                            ?Color(0xFFDCFFEB)
                            : Color(0xFFfdf0df),
            radius: 24,
            child: Icon(
              icon, 
              color: bottomTxt == "Expense" 
              ? Colors.green
              : Color(0xFFff940e)
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Text(
                  topTxt!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bottomTxt!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}