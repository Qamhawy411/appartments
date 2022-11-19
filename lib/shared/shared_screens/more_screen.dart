import 'package:appartments/shared/shared_widget/field_components.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:appartments/shared/shared_theme/shared_colors.dart';
import 'package:appartments/shared/shared_theme/shared_fonts.dart';
import 'package:image_picker/image_picker.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final List<Map<String, dynamic>> sections = [
    {'title': 'Settings', 'icon': Icons.settings, 'route': 'setting'},
    {'title': 'About Us', 'icon': Icons.info, 'route': 'about'},
    {'title': 'Contact us', 'icon': Icons.email, 'route': 'contact'},
    {'title': 'Privacy & Security', 'icon': Icons.security, 'route': 'privacy'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: ListView(children: [
        UserDataSection(),
        for (Map i in sections)
          Container(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(i['title'], style: SharedFonts.primaryBlackFont),
              leading:
                  Icon(i['icon'], size: 20.0, color: SharedColors.blackColor),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: SharedColors.greyColor,
                size: 20,
              ),
              onTap: () {
                Navigator.pushNamed(context, i['route']);
              },
            ),
          ),
      ]),
    );
  }
}

class UserDataSection extends StatefulWidget {
  const UserDataSection({super.key});

  @override
  State<UserDataSection> createState() => _UserDataSectionState();
}

class _UserDataSectionState extends State<UserDataSection> {
  bool gender = false;
  bool editable = false;

  File? pickedImage;

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height / 1.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: Column(
        children: [
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(20.0),
                image: pickedImage == null
                    ? DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/736x/b0/64/9c/b0649cb7f901af840dadde549f9b3f40.jpg'),
                        fit: BoxFit.fill)
                    : DecorationImage(
                        image: FileImage(pickedImage!), fit: BoxFit.fill)),
            alignment: Alignment.center,
            child:editable? IconButton(
              icon: Icon(Icons.add_a_photo),
              color: Colors.grey[100],
              iconSize: 35.0,
              onPressed: 
                   () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.pink[100],
                              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                               
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                  onTap: () {
                                      getImg(ImageSource.camera);
                                      Navigator.of(context).pop();
                                  },
                                  child: Text('Camera', style: SharedFonts.primaryBlackFont),
                                  
                                ),
                                    ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      getImg(ImageSource.gallery);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Gallary', style: SharedFonts.primaryBlackFont),
                                  ),
                                ),
                                ],
                                ),
                              ),
                            );
                          });
                      
                    }
                  
            ):SizedBox(),
          ),
          ListTile(
            title: Text('Name', style: SharedFonts.subBlackFont),
            leading: Icon(Icons.person, color: SharedColors.greyColor),
            trailing: IconButton(
              icon: Icon(editable ? Icons.done : Icons.edit),
              color: SharedColors.orangeColor,
              iconSize: 20.0,
              onPressed: () {
                setState(() {
                  editable = !editable;
                });
              },
            ),
          ),
          CustomField(FieldModel(
              controller: userNameController,
              icon: Icons.person,
              hintTxt: 'ex : QAMHAWY',
              type: TextInputType.name,
              enabled: editable)),
          ListTile(
            title: Text('Email', style: SharedFonts.subBlackFont),
            leading: Icon(Icons.person, color: SharedColors.greyColor),
          ),
          CustomField(FieldModel(
              controller: emailController,
              icon: Icons.email,
              hintTxt: 'ex : mohammedgmaal@gmail.com',
              type: TextInputType.emailAddress,
              enabled: editable)),
          ListTile(
            title: Text('Phone Number', style: SharedFonts.subBlackFont),
            leading: Icon(Icons.person, color: SharedColors.greyColor),
          ),
          CustomField(FieldModel(
              controller: phoneController,
              icon: Icons.phone,
              hintTxt: ' ex : 01126821577',
              type: TextInputType.number,
              enabled: editable)),
          Row(children: [
            Checkbox(
                checkColor: Colors.white,
                activeColor: SharedColors.blackColor,
                value: gender,
                onChanged: editable
                    ? (x) {
                        setState(() {
                          gender = x!;
                        });
                      }
                    : (x) {}),
            Text(
              'Male',
              style: SharedFonts.subGreyFont,
            ),
            Checkbox(
                checkColor: Colors.white,
                activeColor: SharedColors.blackColor,
                value: !gender,
                onChanged: editable
                    ? (x) {
                        setState(() {
                          gender = !x!;
                        });
                      }
                    : (x) {}),
            Text(
              'FeMale',
              style: SharedFonts.subGreyFont,
            ),
          ]),
        ],
      ),
    );
  }

  void getImg(ImageSource source) async {
    XFile? img = await ImagePicker().pickImage(source: source);
    try {
      setState(() {
        pickedImage = File(img!.path);
      });
    } catch (e) {}
  }
}
