
import 'dart:convert';
import 'package:appartments/apartment/apartment_model.dart';
import 'package:appartments/apartment/category_model.dart';
import 'package:appartments/apartment/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as htttp;

class CategoryController extends Cubit<CategoryStates> {
  CategoryController() : super(CategoryIntialState()){
    getcategories();
  }
  String uri =
      "https://appartments-85947-default-rtdb.europe-west1.firebasedatabase.app";
  List<CategoryModel> _categorey = [];
  List<CategoryModel> get getcategory => _categorey;

  List<SpaceModel> _filterCategories = [];
  List<SpaceModel> get getFilterCategories => _filterCategories;

   Future <void> getcategories() async {
    _categorey.clear();
    emit(CategoryLoadingState());
    try {
      htttp.Response response =
          await htttp.get(Uri.parse("$uri/categorey.json"));
          if(response.statusCode==200){
             Map data = json.decode(response.body);
      data.forEach((key, value) {
        _categorey.add(
            CategoryModel(value["categoryImage"], value["categoryName"], key));
        emit(CategoryGotDataState());
      });
          }else{emit(CategoryErorrState());}
     
    } catch (e) {
      
      emit(CategoryErorrState());
    }
  }


     void Filiter(CategoryModel category,List<SpaceModel>spaces){
      _filterCategories.clear();
      emit(FilterCategoryLoadingState());
           for(SpaceModel space in spaces){
            if(space.categoryId==category.id){
              _filterCategories.add(space);
            }
           }
         emit(FilterCategoryState());
       }
}
