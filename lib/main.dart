import 'package:appartments/user/user_views/aboutus_screen.dart';
import 'package:appartments/user/user_views/contact_screen.dart';
import 'package:appartments/user/user_views/login.dart';
import 'package:appartments/user/user_views/privacy_screen.dart';
import 'package:appartments/user/user_views/setting.dart';
import 'package:appartments/user/user_views/signup.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        'setting' : (context) => SettingScreen(),
        'contact' : (context) => ContactScreen(),
        'about' : (context) => AboutScreen(),
        'privacy' : (context) => PrivacyScreen(),
        'signup' : (context) => SignupScreen(),
      },
    );
  }
}
