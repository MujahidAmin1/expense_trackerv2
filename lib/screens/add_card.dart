import 'package:expense_tracker_v2/models/transaction.dart';
import 'package:expense_tracker_v2/providers/transaction_provider.dart';
import 'package:expense_tracker_v2/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:provider/provider.dart';
import '../widgets/monthyear_formatter.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

TextEditingController? cardNumberController;
TextEditingController? holderNameController;
TextEditingController? cvvController;
TextEditingController? expDateController;
TextEditingController? balanceController;

class _AddCardState extends State<AddCard> {
  double? balance;
  @override
  void initState() {
    cardNumberController = TextEditingController();
    holderNameController = TextEditingController();
    cvvController = TextEditingController();
    expDateController = TextEditingController();
    balanceController = TextEditingController();
    super.initState();
  }

  double? convToDouble(String text) {
    return double.tryParse(text);
  }

  @override
  Widget build(BuildContext context) {
    var creditProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Cards"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              inputFormatters: [
                CreditCardFormatter(),
              ],
              controller: cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Card Number',
                hintText: '123xxx',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    inputFormatters: [
                      MonthYearInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    controller: expDateController,
                    decoration: const InputDecoration(
                      labelText: 'Exp. Date',
                      hintText: 'MM/YY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: cvvController,
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      hintText: '123',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: holderNameController,
              decoration: const InputDecoration(
                labelText: 'Holder Name',
                hintText: 'e.g John Doe',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: balanceController,
              decoration: const InputDecoration(
                labelText: 'Your Card Balance',
                hintText: '123...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                balance = convToDouble(balanceController!.text);
                final credit = Credit(
                  holderName: holderNameController!.text,
                  cardNumber: cardNumberController!.text,
                  expDate: expDateController!.text,
                  cvv: cvvController!.text,
                  balance: balance,
                );
                creditProvider.createCard(credit);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(400, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)), // Width and Height
              ),
              child: const Text('Add Your Card'),
            )
          ],
        ),
      ),
    );
  }
}
