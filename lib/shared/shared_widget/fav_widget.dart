import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/apartment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavWidget extends StatefulWidget {
  final double favSize;
  SpaceModel space;
   FavWidget(this.space,this.favSize, {super.key});

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.space.isfav ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
      iconSize: widget.favSize,
      onPressed: () {
        BlocProvider.of<ApartmentController>(context).handleRemovingandAdd(widget.space);
      },
    );
  }
}
