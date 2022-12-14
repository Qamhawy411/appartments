import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/apartment_views/search_result.dart';
import 'package:appartments/apartment/appartment_states.dart';
import 'package:appartments/apartment/category_controller.dart';
import 'package:appartments/apartment/category_states.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:appartments/shared/shared_widget/apartement_hori_widget.dart';
import 'package:appartments/shared/shared_widget/apartment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<ApartmentController, AppartmentStates>(
        builder: (context, state) {
      if (state is AppartmentLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AppartmentErorrState) {
        return Center(
          child: Text(
            "Some Thing Went Wrong",
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
        );
      } else   {
        return RefreshIndicator (
          onRefresh: () async{
            BlocProvider.of<ApartmentController>(context).getSpaces();
         BlocProvider.of<CategoryController>(context).getcategories();
          },
          backgroundColor: Colors.black,
          strokeWidth: 2 ,
          child: Scaffold(
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
                    itemCount: BlocProvider.of<ApartmentController>(context)
                        .getspaces
                        .length,
                    itemBuilder: (context, index) => ApartmentWidget(
                        BlocProvider.of<ApartmentController>(context)
                            .getspaces[index],
                        false),
                  ),
                ),
                titleSection('Nearby to you'),
                for (int i = 0;
                    i <
                        BlocProvider.of<ApartmentController>(context)
                            .getspaces
                            .length;
                    i++)
                  ApartHoriWidget(
                      BlocProvider.of<ApartmentController>(context).getspaces[i])
              ],
            ),
          ),
        );
    }});
  }

  ListTile titleSection(String title) {
    return ListTile(
      title: Text(title, style: SharedFonts.primaryBlackFont),
      trailing: Text('More', style: SharedFonts.subGreyFont),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SearchResult(title)));
      },
    );
  }

  categorySection() {
    return BlocBuilder<CategoryController, CategoryStates>(
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryErorrState) {
          return const Center(
            child: Text(
              "Some Thing Went Wrong00",
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
          );
        } else   {
          return Container(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: BlocProvider.of<CategoryController>(context).getcategory.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        BlocProvider.of<CategoryController>(context).Filiter(BlocProvider.of<CategoryController>(context).getcategory[i], BlocProvider.of<ApartmentController>(context).getspaces);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SearchResult(
                                    BlocProvider.of<CategoryController>(context).getcategory[i].categoryName)));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 7.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    BlocProvider.of<CategoryController>(context).getcategory[i].categoryImage,
                                  ),
                                ),
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(BlocProvider.of<CategoryController>(context).getcategory[i].categoryName,
                                style: SharedFonts.primaryGreyFont)
                          ],
                        ),
                      ),
                    );
                  }));
        } 
      },
    );
  }
}
