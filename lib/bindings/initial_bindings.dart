// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:student_app/controllers/auth_controller.dart';
import 'package:student_app/controllers/theme_controller.dart';
class InitialBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }

}