


import 'package:flutter/material.dart';

class SpaceModel {
  int userId;
  String spaceId;
  String adType;
  String categoryId;
  String rentType;
  num spaceArea;
  num spaceBathRoom;
  num spaceBeds;
  String spaceDescription;
  List spaceImgs;
  num spaceLat;
  num spaceLng;
  String spaceLocation;
  String spaceName;
  num spacePrice;
  bool isfav;
  String wishListId;

  SpaceModel(

      {
        required this.userId,
        required this.adType,
      required this.categoryId,
      required this.rentType,
      required this.spaceArea,
      required this.spaceBathRoom,
      required this.spaceBeds,
      required this.spaceDescription,
      required this.spaceId,
      required this.spaceImgs,
      required this.spaceLat,
      required this.spaceLng,
      required this.spaceLocation,
      required this.spaceName,
      required this.spacePrice,
      required this.isfav,
       required this.wishListId
       });

  factory SpaceModel.fromJson(String id, Map data) {
    return SpaceModel(
      userId:data["userId"] ,
        adType: data["adType"],
        categoryId: data["categoryId"],
        rentType: data["rentType"],
        spaceArea: data["spaceArea"],
        spaceBathRoom: data["spaceBathRoom"],
        spaceBeds: data["spaceBeds"],
        spaceDescription: data["spaceDescription"],
        spaceId: id,
        spaceImgs: data["spaceImgs"],
        spaceLat: data["spaceLat"],
        spaceLng: data["spaceLng"],
        spaceLocation: data["spaceLocation"],
        spaceName: data["spaceName"],
        spacePrice: data["spacePrice"],
         isfav: false,
         wishListId: ""
        );
  }}


  class EditApartmentModel {
  TextEditingController descriptionController;
  TextEditingController addressController;
  TextEditingController priceController;
  TextEditingController nameController;
  TextEditingController areaController;
  TextEditingController bathController;
  TextEditingController bedController;
  String rentType;
  String adType;
  String selectedCategoryId;

  EditApartmentModel(
      {required this.descriptionController,
      required this.addressController,
      required this.priceController,
      required this.nameController,
      required this.areaController,
      required this.bathController,
      required this.bedController,
      required this.rentType,
      required this.adType,
      required this.selectedCategoryId});
}
