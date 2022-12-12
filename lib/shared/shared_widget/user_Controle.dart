import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/apartment_model.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class UserControlle extends StatefulWidget {
  double iconSize;
  SpaceModel space;
   UserControlle(this.space,this.iconSize,{super.key});

  @override
  State<UserControlle> createState() => _UserControlleState();
}

class _UserControlleState extends State<UserControlle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            BlocProvider.of<ApartmentController>(context).deletAppartment(widget.space);
          },
          icon: Icon(Icons.delete),
          color: SharedColors.orangeColor,
          iconSize: widget.iconSize,
        ),
        IconButton(
          onPressed: () {
            
          },
          icon: Icon(Icons.edit),
          color: SharedColors.orangeColor,
          iconSize: widget.iconSize,
        ),
      ],
    );
  }
}