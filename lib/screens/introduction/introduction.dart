import 'package:flutter/material.dart';
import 'package:student_app/configs/themes/app_colors.dart';
import 'package:student_app/widgets/app_circle_button.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 65,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                "This is a study app. You can use it as you want. If you understand how this work, you would able to scale it. With this you will master firebase backend and flutter frondend"),
            const SizedBox(
              height: 40,
            ),
            AppCircleButton(
              onTap: () {
                Get.offAllNamed("/home");
              },
              child: const Icon(
                Icons.arrow_forward,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
