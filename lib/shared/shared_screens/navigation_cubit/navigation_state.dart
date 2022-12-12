import 'package:flutter/cupertino.dart';

abstract class NavigationStates{}
class NavigationChangeStates extends NavigationStates{
  int currentIndex;
  Widget currentScreen;
  NavigationChangeStates(this.currentIndex,this.currentScreen);
}