// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
class AuthController extends GetxController{

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async{
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntroduction();
  }

  void navigateToIntroduction(){
    Get.offAllNamed("/introduction");
  }
}