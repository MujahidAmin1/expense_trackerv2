import 'package:flutter/material.dart';
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF291e60)),
      title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}