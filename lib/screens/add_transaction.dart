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
    var transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7F00FF),
        foregroundColor: const Color(0xFF00FFFF),
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
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(0xFF00FFFF), // Solid background color
                  borderRadius: BorderRadius.circular(8),
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
                                ? const Color(0xFF00FFFF)
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.white, // Default background color
                      selectedColor:
                          const Color(0xFF7F00FF), // Color when selected
                    ),
                    ChoiceChip(
                      label: Text(
                        'Income',
                        style: TextStyle(
                            fontSize: 18,
                            color: _selectedChoice == 'Income'
                                ? const Color(0xFF00FFFF)
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.white, // Default background color
                      selectedColor:
                          const Color(0xFF7F00FF), // Color when selected
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: billerController,
              decoration: InputDecoration(
                hintText: _selectedChoice == "Expense" ? 'Biller' : "Creditor",
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: billerDetailController,
              decoration: InputDecoration(
                hintText: _selectedChoice == "Expense" ? 'Bill details' : 'Credit Details',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                  hintText: 'Amount', 
                  border: OutlineInputBorder(),
                  ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF7F00FF))),
              onPressed: () {
                Transaction _transaction = Transaction(
                  biller: billerController.text,
                  billerDetail: billerDetailController.text,
                  isExpense: switch (_selectedChoice) {
                    'Expense' => true,
                    'Income' => false,
                    _ => null,
                  },
                  date: DateTime.now(),
                  amount: amountController.text,
                );
                if (billerController.text.isNotEmpty &&
                    billerDetailController.text.isNotEmpty &&
                    amountController.text.isNotEmpty) {
                  transactionProvider.addTransact(_transaction);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Must Fill all empty spaces"),
                    ),
                  );
                }
              },
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  color: Color(0xFF00FFFF),
                ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
