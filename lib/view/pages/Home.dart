import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/homepage.dart';
import 'package:workout_helper_app/view/pages/CalorieTrackerPage/calorie_tracker_page.dart';
import 'package:workout_helper_app/view/pages/HeartRateStatsPage/heart_rate_stats_page.dart';
import 'package:workout_helper_app/view/widgets/MyAppBar.dart';
import 'package:workout_helper_app/view/widgets/MyBottomAppBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Heart Rate Stats';
      case 2:
        return 'Calorie Tracker';
      default:
        return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          context: context,
           title: _getAppBarTitle(_currentIndex),
           ),
        bottomNavigationBar: MyBottomAppBar(
          currentIndex: _currentIndex,
          onTap: _navigateToPage,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            MyHomePage(),
            HeartRateStatsPage(),
            CalorieTrackerPage(),
          ],
        ),
      ),
    );
  }
}
