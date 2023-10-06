import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common_widget/CustomBottomNavigation.dart';
import 'drawer/main_drawer.dart';
import 'home_tab/home_tab.dart';
import 'me_tab/me_tab.dart';
import 'license_tab/license_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _index = 0;
  Widget _currentBody = HomeTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: 10,
          child: Image.asset(
            "assets/images/icon.png",
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF0F3F4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(25),
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          alignment: Alignment.topLeft,
          child: _currentBody),
      endDrawer: HomeDrawer(),
      bottomNavigationBar: CustomBottomNavigation(
          onTap: (index) {
            print(index);
            switch (index) {
              case 0:
                _currentBody = HomeTab();
                break;
              case 1:
                _currentBody = LicenseTab();
                break;
              case 2:
                _currentBody = MeTab();
                break;
            }
            setState(() {
              _index = index;
            });
          },
          currentIndex: _index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Color(0xFF324755)),
              activeIcon: Icon(Icons.home, color: Color(0xFF324755)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.idCard, color: Color(0xFF324755)),
              activeIcon: Icon(FontAwesomeIcons.solidIdCard, color: Color(0xFF324755)),
              label: 'Licenses',
            ),
            BottomNavigationBarItem(
              // icon: Icon(Icons.person_outlined),
              icon: Icon(Icons.person_outlined, color: Color(0xFF324755)),
              activeIcon: Icon(Icons.person, color: Color(0xFF324755)),
              label: 'Me',
            ),
          ]),
    );
  }
}
