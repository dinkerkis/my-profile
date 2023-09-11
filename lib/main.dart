import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_profile/util/custom_colors.dart';
import 'package:my_profile/view/login/login_binding.dart';
import 'package:my_profile/view/login/login_screen.dart';

import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final ThemeData theme = ThemeData(fontFamily: 'raleway');

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFE25828),
      ),
    );*/
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'my profile',
            theme: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                primary: CustomColors.colorBlack,
                secondary: CustomColors.colorBlack,
              ),
              canvasColor: CustomColors.colorWhite,
            ),
            getPages: routes(),
            initialBinding: LoginBinding(),
            smartManagement: SmartManagement.full,
            initialRoute: LoginScreen.routeName,
          );
        });
  }
}
