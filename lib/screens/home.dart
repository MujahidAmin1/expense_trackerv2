import 'package:expensetrackerv2/providers/navbar_provider.dart';
import 'package:expensetrackerv2/screens/add_card.dart';
import 'package:expensetrackerv2/screens/add_transaction.dart';
import 'package:expensetrackerv2/screens/profile.dart';
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
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    var navBarProvider = Provider.of<NavBarProvider>(context);
    return Scaffold(
      body: navbarItems[navBarProvider.selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color(0xFF291e60),
        child: const Icon(Icons.add, color: Colors.white,),
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
