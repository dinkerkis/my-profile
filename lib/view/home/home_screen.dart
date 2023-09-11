import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_profile/util/custom_dialog.dart';
import 'package:my_profile/view/edit/edit_screen.dart';
import 'package:my_profile/view/home/home_controller.dart';
import 'package:my_profile/widget/card_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/HomeScreen';
  var mq;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading:false,
        title:  Row(
          children: [
            Spacer(),
            Container(
              child:  Text(
                "Home", textAlign:TextAlign.center,style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w500,),
              ),
            ),
            Spacer(),
            InkWell(
              onTap:(){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog();
                    });
              },
              child: Container(
                child: Image.asset(
                    'assets/images/power.png',color: Colors.white,
                    fit: BoxFit.contain, height: 30, width:30
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: GetX<HomeController>(builder: (controller) {
            return Container(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: mq.size.height * 0.05),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        controller.getImage();
                      },
                      child: ClipOval(
                        child: controller.hasImage.value ? Image.file(controller.image!,width: 100.w,height: 100.w,fit: BoxFit.fill,) : Image.asset('assets/images/profile_user.png',width: 100.w,height: 100.w,fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.commonListValue.value.length,
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(EditScreen.routeName, arguments: {'title': '${controller.commonListValue.value.elementAt(index).title}', 'value': '${controller.commonListValue.value.elementAt(index).value}', 'pos': '$index'});
                                },
                                  child: CardWidget(title: '${controller.commonListValue.value.elementAt(index).title}',value: '${controller.commonListValue.value.elementAt(index).value}')
                              );
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}