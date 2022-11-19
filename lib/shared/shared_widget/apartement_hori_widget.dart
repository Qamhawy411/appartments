import 'package:appartments/apartment/apartment_views/apartment_details.dart';
import 'package:appartments/shared/shared_widget/fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';

import 'package:appartments/shared/shared_widget/apartment_widget.dart';


class ApartHoriWidget extends StatefulWidget {
  const ApartHoriWidget({super.key});

  @override
  State<ApartHoriWidget> createState() => _ApartHoriWidgetState();
}

class _ApartHoriWidgetState extends State<ApartHoriWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ApartementDetails()));
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
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmJJzQysBmY8_mHq70b4-_c6SUGh8uhwz8_w&usqp=CAU'),
                      fit: BoxFit.fill)),
              alignment: Alignment.topLeft,
              child: FavWidget(20),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Duplex Apartmenet  ',
                          style: SharedFonts.subBlackFont),
                      Text('2000\nMonth ', style: SharedFonts.orangeFont),
                    ],
                  ),
                  rowSection('Address', Icons.location_on),
                  Row(
                    children: [
                      rowSection('Beds', Icons.bed),
                      rowSection('Bathroom', Icons.bathroom),
                      rowSection('220M', Icons.social_distance),
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
}
