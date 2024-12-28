import 'package:expense_trackerv2/models/transaction.dart';
import 'package:flutter/material.dart';

class CustomTiles extends StatefulWidget {
  int? index;
  IconData? icon;
  double? width;
  Transaction? transaction;
  CustomTiles({super.key, this.transaction, required this.icon, this.width = double.infinity, this.index});

  @override
  State<CustomTiles> createState() => _CustomTilesState();
}

class _CustomTilesState extends State<CustomTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(33, 150, 243, 1),
      child: ListTile(
        leading: CircleAvatar(
          radius: 7,
          child: Icon(widget.icon),
          ),
        title: Column(
          children: [
              Text(widget.transaction!.name!),
              Text(widget.transaction!.date!),
          ],
        ),
      trailing: Text("\$${widget.transaction!.amount!}"),  
      ),
    );
  }
}