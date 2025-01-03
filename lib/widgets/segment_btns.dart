import 'package:flutter/material.dart';

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
    return Container(
      height: 80,
      child: Row(
        children: [
          const SizedBox(width: 15),
          CircleAvatar(
            radius: 24,
            child: Icon(icon, color: Colors.green,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Text(
                  topTxt!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bottomTxt!,
                  style: const TextStyle(
                    fontSize: 20,
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
