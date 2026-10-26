import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecomerceapp/pages/account_page.dart';
import 'package:ecomerceapp/pages/cart_page.dart';
import 'package:ecomerceapp/pages/home_page_content.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: const [
       HomePageContent(),
       CartPage(),
       AccountPage(),
      ],
     ),
     bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: Colors.white,
      buttonBackgroundColor: const Color(0xff17191c),
      index: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _pageController.jumpToPage(index);
        });
      },
      items: const [
        Icon(Icons.home_outlined, size: 23, color: Color(0xff6b7280)),
        Icon(Icons.shopping_cart_outlined, size: 23, color: Color(0xff6b7280)),
        Icon(Icons.account_circle_outlined, size: 23, color: Color(0xff6b7280)),
      ],
     ),
    );
  }
}