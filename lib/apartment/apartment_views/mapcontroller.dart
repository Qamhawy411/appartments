import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController{
  LatLng _userLating = LatLng (25.354826, 51.183884);
  get getUserLatlng => _userLating;
 Future<void>  userLocation()async{
   bool availablePermission =  await permidssionAvailability();

   if (availablePermission){
   Position userLocation = await  Geolocator.getCurrentPosition();
   _userLating= LatLng(userLocation.latitude,userLocation.longitude );

     }

   }


Future<bool> permidssionAvailability()async{
       LocationPermission  permission= await  Geolocator.checkPermission();
     if(permission== LocationPermission.denied) {
      permission == Geolocator.requestPermission();
      if(permission==LocationPermission.denied) return false;
     }

    bool service =  await  Geolocator.isLocationServiceEnabled();
    if (!service){return false;}
    return true;
   }


   serarchLocation(String address)async{
       bool isDone = await permidssionAvailability();
       if(isDone){
   List<Location>  searchedLocatiojn  = await locationFromAddress(address);
   _userLating = LatLng(searchedLocatiojn[0].latitude, searchedLocatiojn[0].longitude);
      print(_userLating);
   }

}}