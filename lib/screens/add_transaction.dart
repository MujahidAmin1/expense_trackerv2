import 'package:expense_trackerv2/models/transaction.dart';
import 'package:expense_trackerv2/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

late TextEditingController billerController;
late TextEditingController billerDetailController;
late TextEditingController amountController;

class _AddTransactionState extends State<AddTransaction> {
  final List<String> choices = ['Expense', 'Income'];
  String _selectedChoice = 'Expense';
  @override
  void initState() {
    billerController = TextEditingController();
    billerDetailController = TextEditingController();
    amountController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Transaction transaction;
    var transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transaction"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(5), // Padding around the container
                decoration: BoxDecoration(
                  color: Colors.blueAccent, // Solid background color
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8.0, // Space between chips
                  children: [
                    ChoiceChip(
                      label: Text(
                        'Expense',
                        style: TextStyle(
                            fontSize: 18,
                            color: _selectedChoice == 'Expense'
                                ? Colors.white
                                : Colors
                                    .black), // Change text color based on selection
                      ),
                      selected: _selectedChoice == 'Expense',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'Expense' : '';
                        });
                      },
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0), // Custom padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.white, // Default background color
                      selectedColor: Colors.greenAccent, // Color when selected
                    ),
                    ChoiceChip(
                      label: Text(
                        'Income',
                        style: TextStyle(
                            fontSize: 18,
                            color: _selectedChoice == 'Income'
                                ? Colors.white
                                : Colors
                                    .black), // Change text color based on selection
                      ),
                      selected: _selectedChoice == 'Income',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'Income' : '';
                        });
                      },
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0), // Custom padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.white, // Default background color
                      selectedColor: Colors.orangeAccent, // Color when selected
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: billerController,
              decoration: InputDecoration(
                  hintText: 'Biller',
                  border: OutlineInputBorder(),
                  ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: billerDetailController,
              decoration: InputDecoration(
                hintText: 'Bill details',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                  hintText: 'Amount', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: (){
                Transaction _transaction = Transaction(
                  biller: billerController.text,
                  billerDetail: billerDetailController.text,
                  isExpense: switch (_selectedChoice) {
                    'Expense' => true,
                      _ => false,
                  },
                  date: DateTime.now(),
                  amount: amountController.text,
                  );
                  transactionProvider.addTransact(_transaction);
                  Navigator.pop(context);
              }, 
              child: const Text('Add Transaction'),
              )
          ],
        ),
      ),
    );
  }
}
