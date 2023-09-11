import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/util/common.dart';
import 'package:my_profile/util/custom_colors.dart';
import 'package:my_profile/util/shared_preferences.dart';
import 'package:my_profile/view/home/home_screen.dart';
import 'package:my_profile/view/login/login_screen.dart';

class CustomDialog extends StatelessWidget {
  dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('Are you sure you want to logout?', style: TextStyle(color: CustomColors.colorBlack),)),
          SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('Yes', style: TextStyle(color: CustomColors.colorBlack),),
                  onPressed: () {
                    MySharedPreferences.clearSpecific(Common.IS_LOGGED_IN);
                    MySharedPreferences.clearSpecific(Common.USER_IMAGE);
                    Get.offAllNamed(LoginScreen.routeName);
                  },
                ),
                TextButton(
                  child: Text('No', style: TextStyle(color: CustomColors.colorBlack),),
                  onPressed: () {
                    print('Confirmed');
                    Navigator.of(context).pop();
                  },
                ),

                //Icon(Icons.cancel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class SaveButtonDialog extends StatelessWidget {
  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[

          Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: Text('Do you want to leave this page without saving?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)),

          SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Get.toNamed(HomeScreen.routeName);
                  },
                ),
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    print('Confirmed');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}