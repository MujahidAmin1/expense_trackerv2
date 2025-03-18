import 'package:expense_tracker_v2/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_option.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var accountDataProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Avatar
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300], // Placeholder color
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF291e60),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              accountDataProvider.creditCard!.holderName ?? "No Data",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ProfileOption(icon: Icons.edit, title: "Edit Profile", onTap: () {}),
                  ProfileOption(icon: Icons.settings, title: "Settings", onTap: () {}),
                  ProfileOption(icon: Icons.help_outline, title: "Help", onTap: () {}),
                  ProfileOption(icon: Icons.account_circle, title: "Account", onTap: () {}),
                  ProfileOption(icon: Icons.logout, title: "Log Out", onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}