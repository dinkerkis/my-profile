import 'package:get/get.dart';
import 'package:my_profile/view/edit/edit_controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(() => EditController());
  }

}