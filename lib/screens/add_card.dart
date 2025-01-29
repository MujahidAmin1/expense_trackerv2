import 'package:expensetrackerv2/models/transaction.dart';
import 'package:expensetrackerv2/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

TextEditingController? cardNumberController;
TextEditingController? holderNameController;
TextEditingController? cvvController;
TextEditingController? expDateController;

class _AddCardState extends State<AddCard> {
  @override
  void initState() {
    cardNumberController = TextEditingController();
    holderNameController = TextEditingController();
    cvvController = TextEditingController();
    expDateController = TextEditingController();
    super.initState();
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
            ElevatedButton(
              onPressed: () {
                final credit = Credit(
                  holderName: holderNameController!.text,
                  cardNumber: cardNumberController!.text,
                  expDate: expDateController!.text,
                  cvv: cvvController!.text,
                );
                creditProvider.createCard(credit);
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
