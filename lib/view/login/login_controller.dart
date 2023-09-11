import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/model/form_field_data.dart';
import 'package:my_profile/util/common.dart';
import 'package:my_profile/util/shared_preferences.dart';
import 'package:my_profile/view/home/home_screen.dart';

class LoginController extends GetxController {
  Rx<bool> passwordVisible = Rx<bool>(false);
  Rx<bool> isValidEmail = Rx<bool>(false);
  Rx<bool> isValidPassword = Rx<bool>(false);
  Rx<bool> isRememberMe = Rx<bool>(false);
  Rx<TextEditingController> userNameController = Rx<TextEditingController>(TextEditingController(text: ''));
  Rx<Map<String, FormFieldData>> data = Rx<Map<String, FormFieldData>>({
    'EMAIL': FormFieldData(true, ''),
    'PASSWORD': FormFieldData(true, ''),
  });

  @override
  void onInit() {
    super.onInit();
    checkIsLoggedIn();
    checkRememberMe();
  }

  //check if user is already logged in
  void checkIsLoggedIn() async {
    if (await MySharedPreferences.checkKeyExists(Common.IS_LOGGED_IN) && await MySharedPreferences.getBool(Common.IS_LOGGED_IN)) {
      Get.offAllNamed(HomeScreen.routeName);
    }
  }

  //check if user checked the remember me box or not (show email address autofill if remember me was checked)
  checkRememberMe() async {
    if (await MySharedPreferences.checkKeyExists(Common.EMAIL_ADDRESS)) {
      var email = await MySharedPreferences.getString(Common.EMAIL_ADDRESS);
      data.value['EMAIL'] = FormFieldData(false, email);
      isRememberMe.value = true;
      userNameController.value = TextEditingController(text: email);
    }
  }

  //update password visibility status
  void updatePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  //update remember me checkbox checked status
  void updateIsRememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  //login button click validation for email and password
  validateData() async {
    List<String> errors = Common.getErrors(data.value);
    if (errors.isNotEmpty) {
      if (data.value['EMAIL']!.isError!) {
        if (!isValidEmail.value) isValidEmail.value = true;
      } else if (data.value['PASSWORD']!.isError!) {
        if (!isValidPassword.value) isValidPassword.value = true;
      }
      return;
    }

    //if there are no errors redirect user to home screen
    isRememberMe.value ? await MySharedPreferences.setString(Common.EMAIL_ADDRESS, data.value['EMAIL']!.data!) : await MySharedPreferences.clearSpecific(Common.EMAIL_ADDRESS);
    await MySharedPreferences.setBool(Common.IS_LOGGED_IN, isRememberMe.value);
    Get.offAllNamed(HomeScreen.routeName);
  }
}
