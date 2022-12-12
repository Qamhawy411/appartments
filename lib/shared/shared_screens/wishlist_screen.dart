import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/appartment_states.dart';
import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:appartments/shared/shared_widget/apartment_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApartmentController, AppartmentStates>(
      builder: (context, state) {
        if (state is WishListLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WishListErorrState) {
          return Center(
            child: Text(
              "Some Thing Went Wrong",
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
          );
        } else if (state is WishListgotDataState) {
          return Scaffold(
            backgroundColor: SharedColors.backGroundColor,
            body: Column(
              children: [
                SafeArea(
                  top: true,
                  child: ListTile(
                    title: Text(
                        '${BlocProvider.of<ApartmentController>(context).getwishList.length} Items',
                        style: SharedFonts.primaryBlackFont),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: BlocProvider.of<ApartmentController>(context)
                        .getwishList
                        .length,
                    itemBuilder: (context, index) => ApartmentWidget(
                        BlocProvider.of<ApartmentController>(context)
                            .getspaces[index],
                        false),
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: Text(
              "Some Thing Went Wrong",
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
          );
        }
      },
    );
  }
}
