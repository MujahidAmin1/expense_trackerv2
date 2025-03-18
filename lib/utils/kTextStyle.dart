import 'package:flutter/material.dart';

TextStyle kTextStyle({double size = 16, Color color = Colors.black, FontWeight isBold = FontWeight.normal}){
  return TextStyle(
    fontSize: size,
    fontWeight: isBold,
    color: color,
  );
}