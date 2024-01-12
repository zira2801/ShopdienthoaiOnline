import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop/controller/controllers.dart';
import 'package:shop/controller/dasdboard_controller.dart';
import 'package:shop/page/accountwidget.dart';
import 'package:shop/page/categorywidget.dart';
import 'package:shop/page/homewidget.dart';
import 'package:shop/page/menuwidget.dart';
import 'package:provider/provider.dart';

import '../Provider/tab_provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    HomeWidget(),
    MenuWidget(),
    CategoryWidget(),
    AccountWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
          child:
               GNav(
                tabBorderRadius: 25,
                color: Colors.grey,
                activeColor: Colors.black,
                tabActiveBorder: const Border(top: BorderSide(color: Colors.black,width: 1),bottom: BorderSide(color: Colors.black,width: 1),right: BorderSide(color: Colors.black,width: 1),left: BorderSide(color: Colors.black,width: 1)),
                haptic: true,
                iconSize: 20,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                gap: 8,tabs: const [
                GButton(icon: Icons.home,text: 'Home',),
                GButton(icon: Icons.menu_outlined,text: 'Menu',),
                GButton(icon: Icons.category,text: 'Category',),
                GButton(icon: Icons.person,text: 'Account',)
              ],

                 selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              )
          ),
        ),
    );
  }
}
