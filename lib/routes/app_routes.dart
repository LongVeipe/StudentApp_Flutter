// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:student_app/controllers/question_paper/question_paper_controller.dart';
import 'package:student_app/screens/home/home_screen.dart';
import 'package:student_app/screens/introduction/introduction.dart';
import 'package:student_app/screens/login/login_screen.dart';
import 'package:student_app/screens/splash/splash_screen.dart';
import 'package:student_app/services/firebase_storage_service.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(FirebaseStorageService());
              Get.put(QuestionPaperController());
            })),
        GetPage(name: LoginScreen.routerName, page: () => const LoginScreen())
      ];
}
