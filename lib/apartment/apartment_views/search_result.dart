import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/appartment_states.dart';
import 'package:appartments/apartment/category_controller.dart';
import 'package:appartments/apartment/category_states.dart';
import 'package:flutter/material.dart';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:appartments/shared/shared_widget/apartment_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResult extends StatefulWidget {
  final String appBarTitle;
  const SearchResult(this.appBarTitle, {super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApartmentController,AppartmentStates>(
        builder: (context, state) => 
      Scaffold(
        backgroundColor: SharedColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(widget.appBarTitle, style: SharedFonts.primaryBlackFont),
          iconTheme: IconThemeData(color: SharedColors.orangeColor, size: 20.0),
        ),
        body: BlocBuilder<CategoryController,CategoryStates>(
          builder: (context, state) {
            if (state is FilterCategoryLoadingState) {
              return CircularProgressIndicator();
            } else if (BlocProvider.of<CategoryController>(context)
                .getFilterCategories
                .isEmpty) {
              return const Center(
                child: Text(
                  "No Space For this Category",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
              );
            } else {
              return Column(
                children: [
                  SafeArea(
                    top: true,
                    child: ListTile(
                      title: Text('${BlocProvider.of<CategoryController>(context)
                              .getFilterCategories.length} Items', style: SharedFonts.primaryBlackFont),
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
                      itemCount: BlocProvider.of<CategoryController>(context)
                              .getFilterCategories.length,
                      itemBuilder: (context, index) => ApartmentWidget(
                          BlocProvider.of<CategoryController>(context)
                              .getFilterCategories[index],
                          false),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
