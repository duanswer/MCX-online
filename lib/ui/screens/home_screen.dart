import 'package:atm_online/ui/tabs/homePage.dart';
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
          body: HomePage(),
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}
