import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CardWidget({String? title = '',String? value=''}){
  return Card(
    margin: EdgeInsets.only(top: 20.h),
    elevation: 5,
    child: Container(
      padding: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text('${title}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              ),
              Container(
                margin: EdgeInsets.only(left: 10,top: 5),
                child: Image.asset('assets/images/edit.png',height: 20,width: 20,fit: BoxFit.contain,),
              )
            ],
          ),
          Container(
            child: Text('${value}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
          ),
        ],
      ),
    ),
  );
}