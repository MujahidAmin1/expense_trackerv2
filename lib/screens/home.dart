import 'package:expense_trackerv2/providers/navbar_provider.dart';
import 'package:expense_trackerv2/screens/add_transaction.dart';
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
  ];
  @override
  Widget build(BuildContext context) {
    var navBarProvider = Provider.of<NavBarProvider>(context);
    return Scaffold(
      body: navbarItems[navBarProvider.selectedIndex],
      floatingActionButton: FloatingActionButton(
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
        notchMargin: 6,
        child: BottomNavigationBar(
          currentIndex: navBarProvider.selectedIndex,
          selectedItemColor: Colors.black,
          onTap: (value) {
            navBarProvider.changeIndex(value);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.stars_outlined), label: 'Stats'),
          ],
        ),
      ),
    );
  }
}
