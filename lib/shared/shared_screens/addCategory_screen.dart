import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/apartment_model.dart';
import 'package:appartments/apartment/appartment_states.dart';
import 'package:appartments/apartment/category_controller.dart';
import 'package:appartments/apartment/category_model.dart';
import 'package:appartments/shared/shared_widget/field_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appartments/apartment/apartment_views/mapcontroller.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController description = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController bathController = TextEditingController();
  TextEditingController bedController = TextEditingController();
   String rentType = "";
  String adType = "";
  String categoryId = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  GlobalKey<FormState> descriptionKey = GlobalKey<FormState>();
  GlobalKey<FormState> priceKey = GlobalKey<FormState>();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> areaKey = GlobalKey<FormState>();
  GlobalKey<FormState> bathKey = GlobalKey<FormState>();
  GlobalKey<FormState> bedKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApartmentController,AppartmentStates>(
         builder:(context, state) => 
       Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: InkWell(
          onTap: () async {
            if (!_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    textAlign: TextAlign.center,
                    "Some fields required",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )));
            }else{
            
    
            BlocProvider.of<MapController>(context).userLocation();
            BlocProvider.of<ApartmentController>(context).addSpace(SpaceModel(
              userId: 1,
                adType: adType,
                categoryId: categoryId,
                rentType: rentType,
                spaceArea: int.parse(areaController.text),
                spaceBathRoom: int.parse(bathController.text),
                spaceBeds: int.parse(bedController.text),
                spaceDescription: description.text,
                spaceId: " ",
                spaceImgs: [
                  "https://ww1.prweb.com/prfiles/2015/08/28/12932648/Wheeler.jpg"
                      "https://www.udr.com/globalassets/corporate/homepage/homepage_4_1274towson.jpg",
                  "https://i.pinimg.com/736x/4a/a9/55/4aa955a400be6c95a34a61bb0094ba35.jpg",
                  "https://cdn.apartmenttherapy.info/image/upload/v1588574754/small%20cool/Submissions/smaller-501-750-square-feet/small-cool-88721428-smaller-501-750-square-feet-Craig-Strulovitz.jpg",
                  "https://cdn.apartmenttherapy.info/image/upload/v1564756782/at/house%20tours/2019-08/Craig%20S/02-_Living_Room.jpg",
                  "https://storage.googleapis.com/gen-atmedia/2/2018/09/cbd73d21bea2673cc68e712be9dacf4fd631a309.jpeg"
                ],
                spaceLat: BlocProvider.of<MapController>(context)
                    .getUserLatlng
                    .latitude,
                spaceLng: BlocProvider.of<MapController>(context)
                    .getUserLatlng
                    .longitude,
                spaceLocation: addressController.text,
                spaceName: nameController.text,
                spacePrice: int.parse(priceController.text),
                isfav: false,
                wishListId: " "));
            bedController.clear();
            bathController.clear();
            description.clear();
            areaController.clear();
            addressController.clear();
            priceController.clear();
            nameController.clear();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    textAlign: TextAlign.center,
                    "Space Adeded",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )));
          }},
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
            )),
          ),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: ListView(
            children: [
              Stack(children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://ww1.prweb.com/prfiles/2015/08/28/12932648/Wheeler.jpg"),
                          fit: BoxFit.fill),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2)),
                ),
                Positioned(
                  top: 200,
                  right: 100,
                  child: Container(
                      child: Icon(Icons.camera_alt),
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3))),
                )
              ]),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              CustomField(
                FieldModel(
                    controller: description,
                    hintTxt: "Enter Description",
                    key: descriptionKey),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Address ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              CustomField(FieldModel(
                  controller: addressController,
                  hintTxt: "Enter Address",
                  key: addressKey)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Price",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              CustomField(FieldModel(
                  controller: priceController,
                  hintTxt: "Enter Price",
                  key: priceKey,
                  type: TextInputType.number)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              CustomField(FieldModel(
                controller: nameController,
                hintTxt: "Enter Name",
                key: nameKey,
              )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Area",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              CustomField(FieldModel(
                  controller: areaController,
                  hintTxt: "Enter Area",
                  key: areaKey,
                  type: TextInputType.number)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Bathroom",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              CustomField(FieldModel(
                controller: bathController,
                hintTxt: "Enter BathRoom",
                key: bathKey,
                type: TextInputType.number,
              )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Bed",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              CustomField(FieldModel(
                  controller: bedController,
                  hintTxt: "Enter BedRoom",
                  key: bedKey,
                  type: TextInputType.number)),
              ListTile(
                title: Text(
                  "Rent type",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                subtitle: Text(rentType),
                trailing: PopupMenuButton(
                  shape:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  itemBuilder: (context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        child: Text("Monthly",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900)),
                        value: "monthly",
                      ),
                      PopupMenuItem(
                        child: Text("Yearly",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900)),
                        value: "yearly",
                      ),
                      PopupMenuItem(
                        child: Text("Daily",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900)),
                        value: "daily",
                      )
                    ];
                  },
                  onSelected: (value) {
                    rentType = value;
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "Ad type",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                subtitle: Text(adType),
                trailing: PopupMenuButton(
                  color: Colors.green,
                  shape:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  itemBuilder: ((context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        child: Text("Rent",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900)),
                        value: "rent",
                      ),
                      PopupMenuItem(
                        child: Text("Sell",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900)),
                        value: "rent",
                      ),
                    ];
                  }),
                  onSelected: (value) {
                    setState(() {
                      adType = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "Choose Category",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                subtitle: Text(
                  categoryId,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                trailing: PopupMenuButton(
                  itemBuilder: ((context) {
                    return <PopupMenuEntry<String>>[
                      for (CategoryModel category
                          in BlocProvider.of<CategoryController>(context)
                              .getcategory)
                        PopupMenuItem(
                          child: Text(category.categoryName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900)),
                          value: category.id,
                        )
                    ];
                  }),
                  onSelected: ((value) {
                    setState(() {
                      categoryId = value;
                    });
                  }),
                ),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
