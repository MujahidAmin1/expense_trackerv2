import 'package:expense_trackerv2/models/transaction.dart';
import 'package:expense_trackerv2/providers/button_control.dart';
import 'package:expense_trackerv2/widgets/credit_card.dart';
import 'package:expense_trackerv2/widgets/segment_tiles.dart';
import 'package:expense_trackerv2/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var transactionProvider = Provider.of<TransactionProvider>(context);
    var segmentbtnController = Provider.of<ButtonControl>(context);
    final filteredTransactionList = segmentbtnController.isExpense!
        ? transactionProvider.sortedTransactions
            .where((transact) => transact.isExpense!)
            .toList()
        : transactionProvider.sortedTransactions
            .where((transact) => !transact.isExpense!)
            .toList();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Fixed header section using SliverPersistentHeader
            SliverPersistentHeader(
              pinned: true, // Stays fixed when scrolling
              floating: false,
              delegate: FixedHeaderDelegate(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
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
                      Spacer(),
                      Icon(Icons.notifications),
                    ],
                  ),
                ),
              ),
            ),

            // Scrollable content starts here
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    CreditCard(),
                    const SizedBox(height: 30),
                    const Text(
                      "Transactions",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SegmentTiles(icon: Icons.upgrade_sharp),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // Scrollable transaction list
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return TransactionTile(
                      transaction: filteredTransactionList[index],
                      icon: Icons.abc,
                    );
                  },
                  childCount: filteredTransactionList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  FixedHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: Colors.white, // Ensures the header has a background
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: child,
      ),
    );
  }

  @override
  double get maxExtent => 80; // Fixed height of the header
  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
