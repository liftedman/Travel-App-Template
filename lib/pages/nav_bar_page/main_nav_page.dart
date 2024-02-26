import 'package:flutter/material.dart';
import 'package:hiking_travel/pages/nav_bar_page/bar_page.dart';
import 'package:hiking_travel/pages/nav_bar_page/home_page.dart';
import 'package:hiking_travel/pages/nav_bar_page/my_app_page.dart';
import 'package:hiking_travel/pages/nav_bar_page/search_page.dart';

class NavMainPage extends StatefulWidget {
  const NavMainPage({super.key});

  @override
  State<NavMainPage> createState() => _NavMainPageState();
}

class _NavMainPageState extends State<NavMainPage> {
  List pages = [
    const HomePage(),
    const MyAppPage(),
    const MySearchPage(),
    const BarPage(),
  ];
  int pageIndex = 0;
  void unTap(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: unTap,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.4),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: pageIndex,
          elevation: 0,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart_sharp,
                ),
                label: 'Bar'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'My'),
          ]),
      // body:
    );
  }
}
