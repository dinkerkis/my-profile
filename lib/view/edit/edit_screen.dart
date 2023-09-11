import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_profile/util/custom_buttons.dart';
import 'package:my_profile/util/custom_colors.dart';
import 'package:my_profile/util/custom_decorations.dart';
import 'package:my_profile/util/custom_dialog.dart';
import 'package:my_profile/view/edit/edit_controller.dart';

class EditScreen extends StatelessWidget {
  static const routeName = '/EditScreen';
  var controller = Get.put(EditController());
  CustomButtons _customButtons = CustomButtons();
  CustomDecorations _customDecorations = CustomDecorations();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.textEditing.text != controller.value.value) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SaveButtonDialog();
              });
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading:false,
          title: Row(
            children: [
              InkWell(
                onTap:(){
                  if (controller.textEditing.text != controller.value.value) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SaveButtonDialog();
                        });
                  } else {
                    Get.back();
                  }
                },
                child: Container(
                  child: Image.asset('assets/images/left_arrow.png',color: Colors.white, fit: BoxFit.contain, height: 30, width:30),
                ),
              ),
              Spacer(),
              Container(
                child:  Text(
                  'Edit', textAlign:TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        body: Column(
          children: [
            GetX<EditController>(builder: (controller) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${controller.title.value}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: _customDecorations.getCustomDecoration(color: CustomColors.colorWhite, radius: 8.w, border: 1.w, borderColor: CustomColors.colorBlack),
                        child: TextField(
                          cursorColor: Colors.black,
                          controller: controller.textEditing,
                          style: TextStyle(color: CustomColors.colorBlack),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
            SizedBox(height: 20.h,),
            _customButtons.getElevatedButton('Save', () {
              controller.saveData();
            }),
          ],
        ),
      ),
    );
  }
}
