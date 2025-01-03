import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final List<String> choices = ['Expense', 'Income'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Create Invoice"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Wrap(
              spacing: 8.0,
              children: List.generate(
                choices.length,
                (index) {
                  return ChoiceChip(
                    label: Text(
                      choices[index],
                      style: TextStyle(color: Colors.white),
                      ),
                    selected: selectedIndex == index,
                    selectedColor: const Color.fromRGBO(41, 44, 49, 1),
                    backgroundColor: Colors.grey,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
