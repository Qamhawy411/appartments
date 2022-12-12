import 'package:appartments/apartment/apartment_model.dart';

abstract class AppartmentStates {} 
class AppartmentIntialState extends AppartmentStates{}
class AppartmentLoadingState extends AppartmentStates{}
class AppartmentErorrState extends AppartmentStates{}
class AppartmentGotDataState extends AppartmentStates{}

class WishListLoadingState extends AppartmentStates{}
class WishListErorrState extends AppartmentStates{}
class WishListgotDataState extends AppartmentStates{}



class AddAppartmentgotDataState extends AppartmentStates{}
class AddAppartmentErorrState extends AppartmentStates{}



class DeleteIntialState extends AppartmentStates{}
class DeleteGotState extends AppartmentStates{}
class DeleteErorrState extends AppartmentStates{}
class DeleteLoadingState extends AppartmentStates{}