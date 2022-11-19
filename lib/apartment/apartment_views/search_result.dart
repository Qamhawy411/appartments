import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:appartments/shared/shared_widget/apartment_widget.dart';


class SearchResult extends StatefulWidget {
  final String appBarTitle;
  const SearchResult(this.appBarTitle, {super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(widget.appBarTitle, style: SharedFonts.primaryBlackFont),
        iconTheme: IconThemeData(color: SharedColors.orangeColor, size: 20.0),
      ),
      body: Column(
        children: [
          SafeArea(
            top: true,
            child: ListTile(
              title: Text('5 Items', style: SharedFonts.primaryBlackFont),
              trailing: IconButton(
                icon: Icon(Icons.tune),
                color: SharedColors.orangeColor,
                iconSize: 20,
                onPressed: () {},
              ),
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