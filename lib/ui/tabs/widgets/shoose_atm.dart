import 'package:flutter/material.dart';

class ChooseAtm extends StatefulWidget {
  @override
  _ChooseAtmState createState() => _ChooseAtmState();
}

class _ChooseAtmState extends State<ChooseAtm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
