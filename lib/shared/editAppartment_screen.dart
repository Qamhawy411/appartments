import 'package:appartments/apartment/apartment_controller.dart';
import 'package:appartments/apartment/apartment_model.dart';
import 'package:appartments/apartment/appartment_states.dart';
import 'package:appartments/apartment/category_controller.dart';
import 'package:appartments/apartment/category_model.dart';
import 'package:appartments/shared/shared_widget/field_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appartments/apartment/apartment_views/mapcontroller.dart';

class EditScreen extends StatefulWidget {
  SpaceModel space;
   EditScreen(this.space,{super.key});
   

  @override

  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    BlocProvider.of<ApartmentController>(context).prepareScreen(widget.space);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApartmentController,AppartmentStates>(
         builder:(context, state) => 
       Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: InkWell(
          onTap: () async {

            BlocProvider.of<ApartmentController>(context).updateApartment(widget.space);
           
                   widget.space.userId= 1;
                    widget.space. adType=   BlocProvider.of<ApartmentController>(context).editApartmentModel!.adType;
                    widget.space.categoryId= BlocProvider.of<ApartmentController>(context).editApartmentModel!.selectedCategoryId;
                    widget.space. rentType= BlocProvider.of<ApartmentController>(context).editApartmentModel!.rentType;
                    widget.space.  spaceArea= int.parse(BlocProvider.of<ApartmentController>(context).editApartmentModel!.areaController.text);
                    widget.space.spaceBathRoom= int.parse(BlocProvider.of<ApartmentController>(context).editApartmentModel!.bathController.text);
                     widget.space.spaceBeds= int.parse(BlocProvider.of<ApartmentController>(context).editApartmentModel!.bedController.text);
                     widget.space. spaceDescription= BlocProvider.of<ApartmentController>(context).editApartmentModel!.descriptionController.text;
                        widget.space.spaceId= " ";
                      widget.space.spaceImgs= [
                  "https://ww1.prweb.com/prfiles/2015/08/28/12932648/Wheeler.jpg"
                      "https://www.udr.com/globalassets/corporate/homepage/homepage_4_1274towson.jpg",
                  "https://i.pinimg.com/736x/4a/a9/55/4aa955a400be6c95a34a61bb0094ba35.jpg",
                  "https://cdn.apartmenttherapy.info/image/upload/v1588574754/small%20cool/Submissions/smaller-501-750-square-feet/small-cool-88721428-smaller-501-750-square-feet-Craig-Strulovitz.jpg",
                  "https://cdn.apartmenttherapy.info/image/upload/v1564756782/at/house%20tours/2019-08/Craig%20S/02-_Living_Room.jpg",
                  "https://storage.googleapis.com/gen-atmedia/2/2018/09/cbd73d21bea2673cc68e712be9dacf4fd631a309.jpeg"
                ];
          widget.space.spaceLat= BlocProvider.of<MapController>(context)
                    .getUserLatlng
                    .latitude;
          widget.space.spaceLng= BlocProvider.of<MapController>(context)
                    .getUserLatlng
                    .longitude;
               widget.space.spaceLocation= BlocProvider.of<ApartmentController>(context).editApartmentModel!.addressController.text;
           widget.space.spaceName= BlocProvider.of<ApartmentController>(context).editApartmentModel!.nameController.text;
            widget.space.spacePrice= int.parse(BlocProvider.of<ApartmentController>(context).editApartmentModel!.priceController.text);
       widget.space. isfav= false;
            widget.space. wishListId= " ";
           
          },
          
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
            body:  ListView(
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
                    controller: BlocProvider.of<ApartmentController>(context).editApartmentModel!.descriptionController,
                    hintTxt: "Enter Description",
                    ),
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
                  controller: BlocProvider.of<ApartmentController>(context).editApartmentModel!.addressController,
                  hintTxt: "Enter Address",
                  )),
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
                  controller: BlocProvider.of<ApartmentController>(context).editApartmentModel!.priceController,
                  hintTxt: "Enter Price",
                  
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
                controller: BlocProvider.of<ApartmentController>(context).editApartmentModel!.nameController,
                hintTxt: "Enter Name",
                
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
                  controller: BlocProvider.of<ApartmentController>(context).editApartmentModel!.areaController,
                  hintTxt: "Enter Area",
                
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
                controller: BlocProvider.of<ApartmentController>(context).editApartmentModel!.bathController,
                hintTxt: "Enter BathRoom",
               
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
                  controller: BlocProvider.of<ApartmentController>(context).editApartmentModel!.bedController,
                  hintTxt: "Enter BedRoom",
                  
                  type: TextInputType.number)),
              ListTile(
                title: Text(
                  "Rent type",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                subtitle: Text(BlocProvider.of<ApartmentController>(context).editApartmentModel!.rentType),
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
                    BlocProvider.of<ApartmentController>(context).editApartmentModel!.rentType = value;
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
                subtitle: Text(BlocProvider.of<ApartmentController>(context).editApartmentModel!.rentType),
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
                        value: "sell",
                      ),
                    ];
                  }),
                  onSelected: (value) {
                    setState(() {
                      BlocProvider.of<ApartmentController>(context).editApartmentModel!.adType = value;
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
                  BlocProvider.of<ApartmentController>(context).editApartmentModel!.selectedCategoryId,
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
                      BlocProvider.of<ApartmentController>(context).editApartmentModel!.selectedCategoryId = value;
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
    );
  }
}
