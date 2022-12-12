import 'package:appartments/shared/shared_screens/addCategory_screen.dart';
import 'package:appartments/shared/shared_screens/home_page.dart';
import 'package:appartments/shared/shared_screens/map_screen.dart';
import 'package:appartments/shared/shared_screens/more_screen.dart';
import 'package:appartments/shared/shared_screens/navigation_cubit/navigation_state.dart';
import 'package:appartments/shared/shared_screens/wishlist_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationController extends Cubit<NavigationStates>{
  final List _screens = [
  const  HomePage(),
   const mapScreen(),
   const  AddScreen(),
   const WishlistScreen(),
   const MoreScreen(),
    
  ];

  
  NavigationController():  super(NavigationChangeStates(0,const HomePage()));

  move(int index){
    emit(NavigationChangeStates(index,_screens[index]));
  }
}