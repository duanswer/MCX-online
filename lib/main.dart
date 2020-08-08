import 'package:atm_online/ui/tabs/IntroPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IntroPage(),
    title: "ATM Online",
    theme: ThemeData(primarySwatch: Colors.orange, primaryColor: Colors.white),
    debugShowCheckedModeBanner: false,
  ));
}
