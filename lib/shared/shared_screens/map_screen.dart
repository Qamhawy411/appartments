import 'package:appartments/apartment/apartment_views/mapcontroller.dart';
import 'package:appartments/shared/shared_widget/field_components.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  MapController mapController = MapController();
  TextEditingController searchLocationController = TextEditingController();
  @override
  void initState() {
    mapController.userLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: CustomField(FieldModel(
            controller: searchLocationController,
            hintTxt: "Search",
            icon: Icons.search,
            sub: (x) {
              mapController.serarchLocation(x);
              searchLocationController.clear();
            },
          ))),
          Flexible(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: mapController.getUserLatlng,
                zoom: 13,
              ),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: MapType.normal,
            ),
          ),
        ],
      ),
    );
  }
}
