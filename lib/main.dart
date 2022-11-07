import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/bindings/initial_bindings.dart';
import 'package:student_app/data_uploader_screen.dart';
import 'package:student_app/firebase_options.dart';
import 'package:student_app/routes/app_routes.dart';
import 'package:student_app/screens/introduction/introduction.dart';
import 'package:student_app/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }
