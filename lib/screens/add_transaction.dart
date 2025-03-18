import 'package:expense_tracker_v2/models/transaction.dart';
import 'package:expense_tracker_v2/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
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
  double? result;

  @override
  void initState() {
    billerController = TextEditingController();
    billerDetailController = TextEditingController();
    amountController = TextEditingController();
    super.initState();
  }
  double? convertToDouble(String amountText) {
    return double.tryParse(amountText);
  }

  @override
  Widget build(BuildContext context) {
    var transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF291e60),
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
                  color: const Color(0xFF00FFFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8.0,
                  children: [
                    ChoiceChip(
                      label: Text(
                        'Expense',
                        style: TextStyle(
                            fontSize: 18,
                            color: _selectedChoice == 'Expense'
                                ? const Color(0xFF00FFFF)
                                : Colors.black),
                      ),
                      selected: _selectedChoice == 'Expense',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'Expense' : '';
                        });
                      },
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFF291e60),
                    ),
                    ChoiceChip(
                      label: Text(
                        'Income',
                        style: TextStyle(
                            fontSize: 18,
                            color: _selectedChoice == 'Income'
                                ? const Color(0xFF00FFFF)
                                : Colors.black),
                      ),
                      selected: _selectedChoice == 'Income',
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedChoice = selected ? 'Income' : '';
                        });
                      },
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFF291e60),
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
              inputFormatters: [
                ThousandsFormatter(),
              ],
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: const InputDecoration(
                  hintText: 'Amount',
                  border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(400, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                backgroundColor: const Color(0xFF291e60)
              ),
              onPressed: () {
                result = convertToDouble(amountController.text.replaceAll(',', ''));
                if (billerController.text.isNotEmpty &&
                    billerDetailController.text.isNotEmpty &&
                    result != null) {
                  Transaction transaction = Transaction(
                    biller: billerController.text,
                    billerDetail: billerDetailController.text,
                    isExpense: _selectedChoice == 'Expense',
                    date: DateTime.now(),
                    amount: result,
                  );

                  // Add the transaction and navigate back
                  transactionProvider.addTransact(transaction);
                  Navigator.pop(context);
                } else {
                  // Show an error message if any field is empty or conversion failed
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Must fill all fields with valid data"),
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
