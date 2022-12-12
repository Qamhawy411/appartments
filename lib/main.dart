import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/apartment_views/mapcontroller.dart';
import 'package:appartments/apartment/apartment_views/userappqrment.dart';
import 'package:appartments/apartment/appartment_states.dart';
import 'package:appartments/apartment/category_controller.dart';
import 'package:appartments/user/user_views/aboutus_screen.dart';
import 'package:appartments/user/user_views/contact_screen.dart';
import 'package:appartments/user/user_views/login.dart';
import 'package:appartments/user/user_views/privacy_screen.dart';
import 'package:appartments/user/user_views/setting.dart';
import 'package:appartments/user/user_views/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/shared_screens/navigation_cubit/navigation_controller.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: ((context) => ApartmentController())),
       BlocProvider(create: (context) => CategoryController(),),
       BlocProvider(create: (context) => NavigationController(),),
       BlocProvider(create: (context) => MapController()),
      ],
      child: MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          'userAppartment' : (context) => UserAppartments(),
          'setting' : (context) => SettingScreen(),
          'contact' : (context) => ContactScreen(),
          'about' : (context) => AboutScreen(),
          'privacy' : (context) => PrivacyScreen(),
          'signup' : (context) => SignupScreen(),
        },
      ),
    );
  }
}
