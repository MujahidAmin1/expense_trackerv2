import 'package:expense_trackerv2/providers/navbar_provider.dart';
import 'package:expense_trackerv2/screens/add_card.dart';
import 'package:expense_trackerv2/screens/add_transaction.dart';
import 'package:expense_trackerv2/screens/profile.dart';
import 'package:expense_trackerv2/widgets/credit_card.dart';
import 'package:expense_trackerv2/widgets/segment_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'first_screen.dart';
import 'statistics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> navbarItems = [
    const FirstScreen(),
    const Statistics(),
    const AddCard(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    var navBarProvider = Provider.of<NavBarProvider>(context);
    return Scaffold(
      body: navbarItems[navBarProvider.selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color(0xFF7F00FF),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddTransaction();
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: navBarProvider.selectedIndex == 0
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              onPressed: () => navBarProvider.changeIndex(0),
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: navBarProvider.selectedIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              onPressed: () => navBarProvider.changeIndex(1),
            ),
            const SizedBox(width: 40), // Space for FAB cutout
            IconButton(
              icon: Icon(Icons.notifications),
              color: navBarProvider.selectedIndex == 2
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              onPressed: () => navBarProvider.changeIndex(2),
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: navBarProvider.selectedIndex == 3
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              onPressed: () => navBarProvider.changeIndex(3),
            ),
          ],
        ),
      ),
    );
  }
}
