import 'package:flutter/material.dart';
import 'package:fuse/pages/home_page_ui.dart';
import 'package:fuse/util/constants/nav_bar_constants.dart';

import 'mobile_nav_bar.dart';

class HideOnScroll extends StatefulWidget {
  const HideOnScroll({Key? key}) : super(key: key);

  @override
  _HideOnScrollState createState() => _HideOnScrollState();
}

class _HideOnScrollState extends State<HideOnScroll> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController animationController;
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = const [
      MainHomePage(),
      MainHomePage1(),
      MainHomePage2(),
      MainHomePage3(),
    ];
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(navbarItems.elementAt(_selectedIndex).lable ?? ""),
        elevation: 0,
      ),
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: SizeTransition(
        sizeFactor: animationController,
        axisAlignment: -1.0,
        child: NavBarMobile(
          navItems: navbarItems,
          onSelect: _onItemTapped,
        ),
      ),
    );
  }
}
