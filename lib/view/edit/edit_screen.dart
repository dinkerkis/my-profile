import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/util/custom_buttons.dart';
import 'package:my_profile/util/custom_dialog.dart';
import 'package:my_profile/view/edit/edit_controller.dart';

class EditScreen extends StatelessWidget {
  static const routeName = '/EditScreen';
  var controller = Get.put(EditController());
  CustomButtons _customButtons = CustomButtons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading:false,
        title: Row(
          children: [
            InkWell(
              onTap:(){
                Get.back();
                /*if(controller.textEditing.text != controller.value.value){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SaveButtonDialog();
                      });
                }else{
                  Get.back();
                }*/
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

      body: WillPopScope(
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
        child: Column(
          children: [
            GetX<EditController>(builder: (controller) {
                return Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${controller.title.value}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                        TextField(
                          controller: controller.textEditing,
                          //controller: value,
                          decoration: InputDecoration(
                            border: InputBorder.none,

                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,

                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),

            _customButtons.getElevatedButton('Save', () {
              controller.saveData();
            }),
          ],
        ),
      ),
    );
  }
}
