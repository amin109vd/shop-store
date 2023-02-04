import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../features/cart_feature/presentation/screen/cart_screen.dart';
import '../../../features/home_feauture/presentation/screens/home_screen.dart';
import '../../../features/profile_feature/presentation/screen/home_screen.dart';
import '../../../features/search_feature/presentation/screen/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key,});
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  PageController _pageController = PageController(initialPage:pageNumber);
  final GlobalKey<CurvedNavigationBarState> key = GlobalKey();
  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageNumber=0;
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: List.generate(pages.length, (index) => pages[index]),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: key,
        backgroundColor: Colors.white,
        color: const Color(0xff00ADB5),
        index: _pageController.initialPage,
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}
int pageNumber = 0;
