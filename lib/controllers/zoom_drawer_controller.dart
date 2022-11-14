import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:student_app/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  void toggleDrawer() {
    zoomDrawerController.toggle!.call();
    update();
  }

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void website() {
    _launch(Uri(scheme: "fb.com/LongVeipe"));
  }

  void facebook() {
    _launch(Uri(scheme: "fb.com/LongVeipe"));
  }

  void email() {
    final Uri uriEmail = Uri(scheme: 'mailto', path: 'Longveipe@gmail.com');

    _launch(uriEmail);
  }

  Future<void> _launch(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw 'could not  launch $uri';
    }
  }
}
