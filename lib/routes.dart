import 'package:get/get.dart';
import 'package:my_profile/view/edit/edit_binding.dart';
import 'package:my_profile/view/edit/edit_screen.dart';
import 'package:my_profile/view/home/home_binding.dart';
import 'package:my_profile/view/home/home_screen.dart';
import 'package:my_profile/view/login/login_binding.dart';
import 'package:my_profile/view/login/login_screen.dart';

routes() => [
      GetPage(
          name: LoginScreen.routeName,
          binding: LoginBinding(),
          page: () => LoginScreen()),
      GetPage(
          name: HomeScreen.routeName,
          binding: HomeBinding(),
          page: () => HomeScreen()),
      GetPage(
          name: EditScreen.routeName,
          binding: EditBinding(),
          page: () => EditScreen()),
    ];
