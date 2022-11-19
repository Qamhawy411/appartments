import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:appartments/shared/shared_widget/apartment_widget.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: Column(
        children: [
          SafeArea(
            top: true,
            child: ListTile(
              title: Text('6 Items', style: SharedFonts.primaryBlackFont),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => ApartmentWidget(false),
            ),
          )
        ],
      ),
    );
  }
}
