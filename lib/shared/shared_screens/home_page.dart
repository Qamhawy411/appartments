import 'package:appartments/apartment/apartment_views/search_result.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:appartments/shared/shared_widget/apartement_hori_widget.dart';
import 'package:appartments/shared/shared_widget/apartment_widget.dart';
import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> categories = [
    {
      'name': 'Apartment',
      'icon': Icons.apartment,
    },
    {
      'name': 'Land',
      'icon': Icons.landscape,
    },
    {
      'name': 'House',
      'icon': Icons.home,
    },
    {
      'name': 'Agriculture',
      'icon': Icons.agriculture,
    },
    {
      'name': 'House',
      'icon': Icons.home,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          categorySection(),
          titleSection('Recommended'),
          Container(
            height: screenSize.height / 2.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => ApartmentWidget(false),
            ),
          ),
          titleSection('Nearby to you'),
          for (int i = 0; i < 3; i++) ApartHoriWidget()
        ],
      ),
    );
  }

  ListTile titleSection(String title) {
    return ListTile(
      title: Text(title, style: SharedFonts.primaryBlackFont),
      trailing: Text('More', style: SharedFonts.subGreyFont),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => SearchResult(title)));
      },
    );
  }

  Container categorySection() {
    return Container(
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SearchResult(categories[i]['name'])));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 7.0),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(categories[i]['icon'],
                            color: SharedColors.orangeColor, size: 45),
                      ),
                      Text(categories[i]['name'],
                          style: SharedFonts.primaryGreyFont)
                    ],
                  ),
                ),
              );
            }));
  }
}
