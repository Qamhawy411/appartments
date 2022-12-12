import 'package:appartments/apartment/category_model.dart';

abstract class CategoryStates{}
class CategoryLoadingState extends CategoryStates{}
class CategoryIntialState extends CategoryStates{}
class CategoryGotDataState extends CategoryStates{

}
class CategoryErorrState extends CategoryStates{}




class FilterCategoryState extends CategoryStates{} 
class FilterCategoryLoadingState extends CategoryStates{} 