import 'package:expense_tracker_v2/screens/add_card.dart';
import 'package:expense_tracker_v2/utils/kNavigate.dart';
import 'package:flutter/material.dart';

class YourName extends StatelessWidget {
  const YourName({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Text('Whats Your Full name'),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            TextButton(
              onPressed: () {
                navigateTo(context, const AddCard());
              },
              child: const Text("Next"),
            )
          ],
        ),
      )),
    );
  }
}
