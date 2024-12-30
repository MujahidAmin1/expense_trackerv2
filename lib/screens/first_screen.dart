import 'package:expense_trackerv2/widgets/credit_card.dart';
import 'package:expense_trackerv2/widgets/segment_tiles.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Mujahid Amin',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 220),
                    Icon(Icons.notifications),
                  ],
                ),
                const SizedBox(height: 10),
                CreditCard(),
                const SizedBox(height: 30),
                const Text(
                  " Transactions",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              SegmentTiles(icon: Icons.upgrade_sharp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
