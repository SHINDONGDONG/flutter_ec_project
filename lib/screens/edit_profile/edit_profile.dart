

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/firebase_helper/firebase_storage/firebase_storage_helper.dart';
import 'package:flutter_ec_project/provider/app_provider.dart';
import 'package:flutter_ec_project/widgets/primary_button/primary_button.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  File? image;
  void takePicture() async {
    XFile? value =  await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 40);
    if(value !=null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          image == null ?
          CupertinoButton(
            onPressed: () {
              takePicture();
            },
            child: CircleAvatar(
              radius: 70,
              child:
                const Icon(Icons.camera_alt)
            ),
          ):
          CupertinoButton(
            onPressed: () {
              takePicture();
            },
            child: CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(image!),
            ),
          ),
          const Gap(12),
          TextFormField(
            decoration: InputDecoration(
              hintText: appProvider.getUserInformation.name
            ),
          ),
          const Gap(12),
          PrimaryButton(
            title: "Update",
            onPressed: () async {
              String imageUrl = await FirebaseStorageHelper.instance.uploadUserImage(image!);
              print(imageUrl);
            },
          ),
        ],
      ),
    );
  }
}
