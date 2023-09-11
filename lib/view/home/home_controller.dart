import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_profile/model/card_model.dart';
import 'package:my_profile/util/common.dart';
import 'package:my_profile/util/shared_preferences.dart';

class HomeController extends GetxController {
  Rx<List<CardModel>> commonListValue = Rx<List<CardModel>>([]);
  Rx<bool> hasImage = Rx<bool>(false);
  File? image;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkUserImage();
    commonListValue.value.add(CardModel('Name','Dinker Malhotra',));
    commonListValue.value.add(CardModel('Email','dinker.kis@gmail.com',));
    commonListValue.value.add(CardModel('Skills','Flutter, Dart, Objective-C and Swift',));
    commonListValue.value.add(CardModel('Work Experience','Total Experience: 10+ years\n\n• June 2013 – Dec 2016: Mobile Application Developer at Aween Technologies Pvt. Ltd.\n\n• Jan 2017 - Till now: Senior Software developer at Krishna Innovative Software Pvt. Ltd.',));
  }

  //check if user has already selected an image from gallery
  checkUserImage() async {
    if (await MySharedPreferences.checkKeyExists(Common.USER_IMAGE)) {
      final imageTemporary = File(await MySharedPreferences.getString(Common.USER_IMAGE));
      image = imageTemporary;
      hasImage.value = true;
    }
  }

  //get image from gallery and set on UI
  getImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      print("imageTemporary    ${imageTemporary}" );
      this.image = imageTemporary;
      await MySharedPreferences.setString(Common.USER_IMAGE, image.path);
      hasImage.value = true;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
      await MySharedPreferences.clearSpecific(Common.USER_IMAGE);
      hasImage.value = false;
    }
    hasImage.refresh();
  }
}