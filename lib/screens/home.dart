import 'package:expense_trackerv2/providers/navbar_provider.dart';
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
  List<Widget> navbarItems = <Widget>[
    FirstScreen(),
    Statistics(),
  ];
  @override
  Widget build(BuildContext context) {
    var navbar_data = Provider.of<NavBarProvider>(context);
    return Scaffold(
      body: navbarItems[navbar_data.selectedIndex],
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){}
        ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: BottomNavigationBar(
          currentIndex: navbar_data.selectedIndex,
          selectedItemColor: Colors.grey,
          onTap: (value){
            navbar_data.onTapped;
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.stars_outlined), label: 'Stats'),
          ],
          ),
      ),
    );
  }
}
