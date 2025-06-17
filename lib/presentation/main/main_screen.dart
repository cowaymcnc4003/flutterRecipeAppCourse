import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;
  const MainScreen({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
          onDestinationSelected: onChangeIndex,
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: ColorStyles.gray4,
                ),
                selectedIcon: Icon(
                  Icons.home,
                  color: ColorStyles.primary100,
                ),
                label: 'home'),
            NavigationDestination(
                icon: Icon(
                  Icons.bookmark_border,
                  color: ColorStyles.gray4,
                ),
                selectedIcon: Icon(Icons.book),
                label: 'book'),
            NavigationDestination(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: ColorStyles.gray4,
                ),
                selectedIcon: Icon(Icons.notifications),
                label: 'notification'),
            NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: ColorStyles.gray4,
                ),
                selectedIcon: Icon(Icons.person),
                label: 'profile'),
          ]),
    );
  }
}
