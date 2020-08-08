import 'package:atm_online/ui/tabs/homePage.dart';
import 'package:atm_online/ui/tabs/widgets/custom_drawer.dart';
import 'package:atm_online/ui/tabs/widgets/shoose_atm.dart';
import 'package:flutter/material.dart';

class HomeSreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text(
              "MCX Online",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange,
            iconTheme: IconThemeData(color: Colors.white),
            actions: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
              )
            ],
          ),
          body: HomePage(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Selecione um ATM no mapa",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: ChooseAtm(),
          drawer: CustomDrawer(_pageController),
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
      ],
    );
  }
}
