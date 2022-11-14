import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class MyZoomDrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();
  void toggleDrawer(){
    zoomDrawerController.toggle!.call();
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void signOut(){

  }

  void signIn(){

  }

  void website(){

  }

  void email(){
    final Uri uriEmail = Uri(
      scheme: 'mailto',
      path: 'Longveipe@gmail.com'
    );

    _launch(uriEmail);
  }

  Future<void> _launch(Uri uri) async{
    if(!await launchUrl(uri)){
      throw 'could not  launch $uri';
    }
  }
}