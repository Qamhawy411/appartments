import 'package:appartments/apartment/apartment_views/apartment_details.dart';
import 'package:appartments/shared/shared_widget/fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';



class ApartmentWidget extends StatefulWidget {
  final bool isDetials;
  const ApartmentWidget(this.isDetials, {super.key});

  @override
  State<ApartmentWidget> createState() => _ApartmentWidgetState();
}

class _ApartmentWidgetState extends State<ApartmentWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isDetials == false ? () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ApartementDetails()));
      } : () {},
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        margin: EdgeInsets.all(10.0),
        decoration: customDecoration(widget.isDetials),
        child: Column(
          children: [
            Container(
                height: 195,
                margin: EdgeInsets.only(bottom: 7.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmJJzQysBmY8_mHq70b4-_c6SUGh8uhwz8_w&usqp=CAU'),
                        fit: BoxFit.fill)),
                alignment: Alignment.topRight,
                child: widget.isDetials == false ? FavWidget(30) : SizedBox() ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('  Duplex Home', style: SharedFonts.subBlackFont),
                    Text('\$2000/month  ', style: SharedFonts.orangeFont)
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
          ],
        ),
      ),
    );
  }
}

Padding rowSection(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
    child: Row(
      children: [
        Icon(icon, color: SharedColors.greyColor, size: 12),
        Text(' $title', style: SharedFonts.subGreyFont)
      ],
    ),
  );
}

BoxDecoration customDecoration(bool isDetails) {
  return BoxDecoration(
      color: isDetails == false ? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(20.0));
}
