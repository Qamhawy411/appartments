import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/appartment_states.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:appartments/shared/shared_widget/apartment_widget.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAppartments extends StatefulWidget {
  const UserAppartments({super.key});

  @override
  State<UserAppartments> createState() => _UserAppartmentsState();
}

class _UserAppartmentsState extends State<UserAppartments> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApartmentController,AppartmentStates>(
      builder: (context, state) => 
       Scaffold(
          backgroundColor: SharedColors.backGroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text('My Apartments', style: SharedFonts.primaryBlackFont),
            iconTheme: IconThemeData(color: SharedColors.orangeColor, size: 20.0),
          ),
          body: Column(
            children: [
              SafeArea(
                top: true,
                child: ListTile(
                  title: Text('${BlocProvider.of<ApartmentController>(context).getuserSpaces.length} Items',
                      style: SharedFonts.primaryBlackFont),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: BlocProvider.of<ApartmentController>(context).getuserSpaces.length,
                  itemBuilder: (context, index) =>
                      ApartmentWidget(BlocProvider.of<ApartmentController>(context).getuserSpaces[index], false),
                ),
              )
            ],
          ),
        ),
    );
  }
}