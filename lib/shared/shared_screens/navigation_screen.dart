import 'package:appartments/shared/shared_screens/addCategory_screen.dart';
import 'package:appartments/shared/shared_screens/home_page.dart';
import 'package:appartments/shared/shared_screens/more_screen.dart';
import 'package:appartments/shared/shared_screens/navigation_cubit/navigation_controller.dart';
import 'package:appartments/shared/shared_screens/navigation_cubit/navigation_state.dart';
import 'package:appartments/shared/shared_screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'map_screen.dart';




class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationController,NavigationStates>(
      builder: (context, state) {
        if(state is NavigationChangeStates ){
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
            navItem('Add', Icons.add),
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
          type: BottomNavigationBarType.shifting,
          currentIndex: state.currentIndex,
          onTap: (i) {
            BlocProvider.of<NavigationController>(context).move(i);
          },
        ),
        body:state.currentScreen, 
       
    
      );
        }else{
           return Center(
          child: Text(
            "Some Thing Went Wrong In Navigation",
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
        );
        }
      },
    
    );
  }

  BottomNavigationBarItem navItem(String title, IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }
}
