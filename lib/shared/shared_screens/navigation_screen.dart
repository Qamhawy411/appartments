import 'package:appartments/shared/shared_screens/home_page.dart';
import 'package:appartments/shared/shared_screens/more_screen.dart';
import 'package:appartments/shared/shared_screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'map_screen.dart';




class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedScreen = 0;
  final List screens = [
    HomePage(),
    mapScreen(),
    WishlistScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location', style: SharedFonts.subBlackFont),
            Row(
              children: [
                Icon(Icons.location_on,
                    color: SharedColors.orangeColor, size: 17),
                Text('  DiarbNegm, Egypt  ', style: SharedFonts.subBlackFont),
                Icon(Icons.arrow_downward,
                    color: SharedColors.orangeColor, size: 17),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.notifications, color: SharedColors.orangeColor, size: 20)
        ],
      ),
      backgroundColor: SharedColors.backGroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          navItem('Home', Icons.home),
          navItem('Map', Icons.location_on),
          navItem('Wishlist', Icons.favorite),
          navItem('More', Icons.more_horiz),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        selectedIconTheme:
            IconThemeData(color: SharedColors.orangeColor, size: 20.0),
        unselectedIconTheme:
            IconThemeData(color: SharedColors.greyColor, size: 18.0),
        selectedLabelStyle: SharedFonts.subBlackFont,
        unselectedLabelStyle: SharedFonts.subGreyFont,
        selectedItemColor: SharedColors.orangeColor,
        unselectedItemColor: SharedColors.greyColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedScreen,
        onTap: (i) {
          setState(() {
            selectedScreen = i;
          });
        },
      ),
      body: screens[selectedScreen],
    );
  }

  BottomNavigationBarItem navItem(String title, IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }
}
