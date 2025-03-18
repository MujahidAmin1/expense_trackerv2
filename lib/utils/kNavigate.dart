import 'package:flutter/material.dart';

Future<Object?> navigateTo(BuildContext context, Widget route) async {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}
