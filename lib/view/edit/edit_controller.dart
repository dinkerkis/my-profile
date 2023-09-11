import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController{
  var status = false.obs;
  var textEditing = TextEditingController();
  Rx<String> title = Rx<String> ('');
  Rx<String> value = Rx<String> ('');
  Rx<String> pos = Rx<String> ('');

  @override
  void onInit() {
    super.onInit();
    status.value = false;
  }

  void getArguments() {
    var args = Get.arguments;
    title.value = args['title'];
    value.value = args['value'];
    pos.value = args['pos'];
  }

  valueChange(String? text) {
    textEditing.text = text!;
    update();
  }

  void saveData() {
    switch(pos) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;

    }
  }
}