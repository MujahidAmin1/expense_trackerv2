import 'package:expense_tracker_v2/providers/navbar_provider.dart';
import 'package:expense_tracker_v2/screens/add_card.dart';
import 'package:expense_tracker_v2/screens/add_transaction.dart';
import 'package:expense_tracker_v2/screens/profile.dart';
import 'package:expense_tracker_v2/utils/kNavigate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'first_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> navbarItems = [
    const FirstScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    var navBarProvider = Provider.of<NavBarProvider>(context);
    return Scaffold(
      body: navbarItems[navBarProvider.selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color(0xFF291e60),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          navigateTo(context, AddTransaction());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white38,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: navBarProvider.selectedIndex == 0
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              onPressed: () => navBarProvider.changeIndex(0),
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.person),
              color: navBarProvider.selectedIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              onPressed: () => navBarProvider.changeIndex(1),
            ),
          ],
        ),
      ),
    );
  }
}
