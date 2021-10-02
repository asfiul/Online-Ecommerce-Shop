import 'package:flutter/material.dart';
import 'package:online_ecommerce_shop/screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: "Online Shop",
    theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22)),
    home: Homepage(),
  ));
}
