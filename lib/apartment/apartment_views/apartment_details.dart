import 'package:appartments/shared/shared_widget/fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:appartments/apartment/apartment_views/search_result.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:appartments/shared/shared_widget/apartement_hori_widget.dart';
import 'package:appartments/shared/shared_widget/apartment_widget.dart';



class ApartementDetails extends StatefulWidget {
  const ApartementDetails({super.key});

  @override
  State<ApartementDetails> createState() => _ApartementDetailsState();
}

class _ApartementDetailsState extends State<ApartementDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: decorationContainer(
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: SharedColors.greyColor,
            iconSize: 20.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text('Details', style: SharedFonts.primaryBlackFont),
        centerTitle: true,
        actions: [
          decorationContainer(FavWidget(20.0))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width/1.2,
          decoration: BoxDecoration(
            color: SharedColors.orangeColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          alignment: Alignment.center,
          child: Text('Rent Now', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ApartmentWidget(true),
            ListTile(
              title: Text('Description', style: SharedFonts.primaryBlackFont),
              subtitle: Text('Description', style: SharedFonts.primaryGreyFont,),
            ),
            ListTile(
              title: Text('Gallery  ', style: SharedFonts.primaryBlackFont),
            ),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmJJzQysBmY8_mHq70b4-_c6SUGh8uhwz8_w&usqp=CAU'),
                        fit: BoxFit.fill
                      )
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container decorationContainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: child
    );
  }
}