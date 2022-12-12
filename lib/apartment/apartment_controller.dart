import 'dart:convert';
import 'package:appartments/apartment/apartment_model.dart';
import 'package:appartments/apartment/appartment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as htttp;

class ApartmentController extends Cubit<AppartmentStates> {
  ApartmentController() : super(AppartmentIntialState()){
    getSpaces();
    getWishList();
  }
  List<SpaceModel> _spaces = [];
  List<SpaceModel> get getspaces => _spaces;
  List<SpaceModel> _userSpaces = [];
  List<SpaceModel> get getuserSpaces => _userSpaces;
  List<SpaceModel> _wishList = [];
  List<SpaceModel> get getwishList => _wishList;
  String uri =
      "https://appartments-85947-default-rtdb.europe-west1.firebasedatabase.app";

  Future<void> getSpaces() async {
    emit(AppartmentLoadingState());
    try {
      htttp.Response response = await htttp.get(Uri.parse("$uri/spaces.json"));
      if (response.statusCode == 200) {
        _spaces.clear();
        Map data = json.decode(response.body);
        data.forEach((key, value) {
          SpaceModel space = SpaceModel.fromJson(key, value);
          _spaces.add(space);
          if(space.userId==1){
            
           _userSpaces.add(space);
          }
        });
        emit(AppartmentGotDataState());
      } else {
        
        emit(AppartmentErorrState());
      }
    } catch (e) {
      print(e);
      emit(AppartmentErorrState());
    }
  }

  Future<void> getWishList() async {
    emit(WishListLoadingState());
    try {
      htttp.Response response =
          await htttp.get(Uri.parse("$uri/wishlist.json"));
      Map data = json.decode(response.body);
      if (response.statusCode == 200) {
        data.forEach((key, value) {
          for (SpaceModel space in _spaces) {
            if (space.spaceId == value["spaceId"]) {
                space.isfav = true;
              _wishList.add(space);
            } } });
    emit(WishListgotDataState());  } else {
        emit(WishListErorrState());
      }
    } catch (e) {
      emit(WishListErorrState());
    }
  }

  Future<void> handleRemovingandAdd(SpaceModel space) async {
    bool isSuccess = false;
    if (space.isfav) {
      isSuccess = await _removeFromWishList(space);
    } else {
      isSuccess = await _addToWhishList(space);
    }
    emit(isSuccess? WishListgotDataState():WishListErorrState());
  }

  Future<bool> _addToWhishList(SpaceModel space) async {
    try {
      Map sentData = {"spaceId": space.spaceId, "userId": 1};
      htttp.Response response = await htttp
          .post(Uri.parse("$uri/wishlist.json"), body: json.encode(sentData));
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        space.wishListId=data["name"];
        space.isfav = true;
        _wishList.add(space);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _removeFromWishList(SpaceModel space) async {
    try {
      htttp.Response response =
          await htttp.delete(Uri.parse("$uri/wishlist/${space.wishListId}.json"));
      if (response.statusCode == 200) {
        space.isfav=false;
        for (int i = 0; i < _wishList.length; i++) {
          if (space.spaceId == _wishList[i].spaceId) {
            _wishList.removeAt(i);
           break;
          } 

        }
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

    Future <void > addSpace(SpaceModel space)async{
      try{

        Map sentData={
      "userId":space.userId,
      'adType': space.adType,
      'categoryId': space.categoryId,
      'rentType': space.rentType,
      'spaceArea': space.spaceArea,
      'spaceBathRoom': space.spaceBathRoom,
      'spaceBeds': space.spaceBeds,
      'spaceDescription': space.spaceDescription,
      'spaceImgs': space.spaceImgs,
      'spaceLat': space.spaceLat,
      'spaceLng': space.spaceLng,
      'spaceLocation': space.spaceLocation,
      'spaceName': space.spaceName,
      'spacePrice': space.spacePrice,
    };  

   htttp.Response response = await htttp.post(Uri.parse("$uri/spaces.json"),
    body: json.encode(sentData) 
   );
   if(response.statusCode==200){
    Map data = json.decode(response.body);
    space.spaceId= data["name"];
    _spaces.add(space);
    _userSpaces.add(space);
    emit(AddAppartmentgotDataState());
   }else{AddAppartmentErorrState();}
      }catch(e){
        emit(AddAppartmentErorrState());
      };
    
      
   
    }

   Future<void>deletAppartment(SpaceModel space)async{
    emit(DeleteLoadingState());
    try{ htttp.Response response = await htttp.delete(Uri.parse('$uri/spaces/${space.spaceId}.json'));
   if(response.statusCode==200){
    for(int i =0;i<_spaces.length;i++){
      if(space.spaceId==_spaces[i].spaceId){
        _spaces.removeAt(i);
        break;
      }
    }
    for(int i =0;i<_userSpaces.length;i++){
      if(space.spaceId==_userSpaces[i].spaceId){
        _userSpaces.removeAt(i);
        break;
      }
    }
    emit(DeleteGotState());
   }else{emit(DeleteErorrState());}
   
   }catch(e){
    emit(DeleteErorrState());
   }
  

   }


    


}
