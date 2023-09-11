import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_profile/model/form_field_data.dart';
import 'package:my_profile/util/common.dart';
import 'package:my_profile/util/custom_buttons.dart';
import 'package:my_profile/util/custom_colors.dart';
import 'package:my_profile/util/custom_decorations.dart';
import 'package:my_profile/util/custom_input_decorations.dart';
import 'package:my_profile/view/login/login_controller.dart';
import 'package:my_profile/widget/error_view_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/LoginScreen';
  static final _formKey = GlobalKey<FormState>();
  static final CustomDecorations _customDecorations = CustomDecorations();
  static final CustomInputDecorations _customInputDecorations = CustomInputDecorations();
  static final CustomButtons _customButtons = CustomButtons();
  static final ErrorViewWidget _errorViewWidget = ErrorViewWidget();
  var mq;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: mq.size.height,
            color: CustomColors.colorWhite,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: GetX<LoginController>(builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      Text('Login', style: TextStyle(color: Colors.black, fontSize: 36.sp, fontWeight: FontWeight.w600)),
                      SizedBox(height: 25.h,),
                      Container(
                        decoration: _customDecorations.getCustomDecoration(color: CustomColors.colorWhite, radius: 8.w, border: 1.w, borderColor: CustomColors.colorBlack),
                        child: TextFormField(
                          //initialValue: 'dinker.kis@gmail.com',
                          controller: controller.userNameController.value,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: CustomColors.colorAccent,
                          decoration: _customInputDecorations.getInputDecoration('Username'),
                          style: TextStyle(
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: CustomColors.colorBlack,
                          ),
                          onChanged: (text) {
                            if (controller.isValidEmail.value) {
                              controller.isValidEmail.value = false;
                            }
                          },
                          validator: (value) {
                            value = value!.replaceAll(' ', '');
                            if (value.trim().isEmpty) {
                              controller.data.value['EMAIL'] = FormFieldData(true, "Please enter username");
                            } else if (!Common.isValidEmail(value.trim())) {
                              controller.data.value['EMAIL'] = FormFieldData(true, "Please enter some valid username");
                            } else if (value.trim() != 'dinker.kis@gmail.com') {
                              controller.data.value['EMAIL'] = FormFieldData(true, "Please enter correct username");
                            } else {
                              controller.data.value['EMAIL'] = FormFieldData(false, value.trim());
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 1.h),
                      controller.isValidEmail.value
                          ? _errorViewWidget.getErrorViewWidget(controller.data.value['EMAIL']!.data!)
                          : SizedBox(height: 12.h),
                      SizedBox(height: 10.h),
                      Container(
                        decoration: _customDecorations.getCustomDecoration(color: CustomColors.colorWhite, radius: 8.w, border: 1.w, borderColor: CustomColors.colorBlack),
                        child: TextFormField(
                          //initialValue: 'dinker',
                          keyboardType: TextInputType.text,
                          cursorColor: CustomColors.colorAccent,
                          obscureText:
                          !controller.passwordVisible.value,
                          decoration: _customInputDecorations.getPasswordInputDecoration('Password',
                              controller.passwordVisible.value,
                                  () {
                                controller.updatePasswordVisibility();
                              }),
                          style: TextStyle(
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: CustomColors.colorBlack,
                          ),
                          onChanged: (text) {
                            if (controller.isValidPassword.value) {
                              controller.isValidPassword.value = false;
                            }
                          },
                          validator: (value) {
                            controller.data.value['PASSWORD'] = FormFieldData(true, value!);
                            if (value.trim().isEmpty) {
                              controller.data.value['PASSWORD'] = FormFieldData(true, "Please enter password");
                            } else if (Common.isValidPassword(value)) {
                              controller.data.value['PASSWORD'] = FormFieldData(true, 'Please enter password between 6 to 30 characters');
                            } else if (value.trim() != 'dinker') {
                              controller.data.value['PASSWORD'] = FormFieldData(true, "Please enter correct password");
                            } else {
                              controller.data.value['PASSWORD'] = FormFieldData(false, value);
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 1.h),
                      controller.isValidPassword.value
                          ? _errorViewWidget.getErrorViewWidget(controller.data.value['PASSWORD']!.data!)
                          : SizedBox(height: 12.h),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.updateIsRememberMe();
                            },
                            child: SvgPicture.asset(
                              controller.isRememberMe.value
                                  ? 'assets/images/tick.svg'
                                  : 'assets/images/untick.svg',
                              height: 22.sp,
                              width: 22.sp,
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                controller.updateIsRememberMe();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 4.w, bottom: 4.w),
                                child: Text('Remember Me', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp, color: CustomColors.colorBlack,),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      _customButtons.getElevatedButton('Login', () {
                        _formKey.currentState!.validate();
                        controller.validateData();
                      }),
                      SizedBox(height: 10.h),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
