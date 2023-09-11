import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/model/card_model.dart';
import 'package:my_profile/view/home/home_controller.dart';

class EditController extends GetxController{
  var status = false.obs;
  var textEditing = TextEditingController();
  Rx<String> title = Rx<String> ('');
  Rx<String> value = Rx<String> ('');
  Rx<String> pos = Rx<String> ('');

  @override
  void onInit() {
    super.onInit();
    getArguments();
    status.value = false;
  }

  void getArguments() {
    var args = Get.arguments;
    print('previous screen route name: ${Get.previousRoute}');
    textEditing = TextEditingController(text: args['value']);
    title.value = args['title'];
    value.value = args['value'];
    pos.value = args['pos'];
    print('textEditing: ${args}');
  }

  //save data to previous screen and auto back
  void saveData() {
    Get.find<HomeController>().commonListValue.value[int.parse(pos.value)].value = textEditing.text;
    Get.delete<EditController>();
    Get.back();
  }
}