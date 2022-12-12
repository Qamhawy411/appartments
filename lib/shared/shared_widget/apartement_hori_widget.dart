import 'package:appartments/apartment/apartment_model.dart';
import 'package:appartments/apartment/apartment_views/apartment_details.dart';
import 'package:appartments/shared/shared_widget/fav_widget.dart';
import 'package:appartments/shared/shared_widget/user_Controle.dart';
import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';

import 'package:appartments/shared/shared_widget/apartment_widget.dart';


class ApartHoriWidget extends StatefulWidget {
  SpaceModel space;
   ApartHoriWidget(this.space,{super.key});

  @override
  State<ApartHoriWidget> createState() => _ApartHoriWidgetState();
}

class _ApartHoriWidgetState extends State<ApartHoriWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ApartementDetails(widget.space)));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: customDecoration(false),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 125.0,
              height: 125,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.space.spaceImgs[2]),
                      fit: BoxFit.fill)),
              alignment: Alignment.topLeft,
              child: topWidget(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.space.spaceName}  ',
                          style: SharedFonts.subBlackFont),
                      Text('${widget.space.spacePrice}\n${widget.space.rentType} ', style: SharedFonts.orangeFont),
                    ],
                  ),
                  rowSection('${widget.space.spaceLocation}', Icons.location_on),
                  Row(
                    children: [
                      rowSection('${widget.space.spaceBeds}Beds', Icons.bed),
                      rowSection('${widget.space.spaceBathRoom}Bathroom', Icons.bathroom),
                      rowSection('${widget.space.spaceArea}M', Icons.social_distance),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
   Widget topWidget(){
     if(widget.space.userId==1){
      return UserControlle(widget.space, 20);
     }else return FavWidget(widget.space, 30);
  }
}
