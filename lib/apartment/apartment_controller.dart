import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController{
  LatLng _lating =LatLng(30.033333, 31.233334);
  get getlating=> _lating;
 Future<void> getUserLocation()async{
    bool isdone=  await mapStatus();

    if (isdone){
      Position currentPosition = await Geolocator.getCurrentPosition();
   _lating= LatLng(currentPosition.altitude, currentPosition.longitude);
    }
 

  }


 Future<bool> mapStatus()async{
        LocationPermission permission= await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission=  await   Geolocator.requestPermission();
      if(permission==LocationPermission.denied){
              return false;
      }
    }

 bool service=  await  Geolocator.isLocationServiceEnabled();
 if(!service){
    return false;
 }
 return true;



  }

}