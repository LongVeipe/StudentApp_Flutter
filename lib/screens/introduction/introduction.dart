import 'package:flutter/material.dart';
import 'package:student_app/configs/themes/app_colors.dart';
import 'package:student_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context)
        ),
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 65,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
                "this is a study app. You can use it as you want. If you understand how this work, you would able to scale it. With this you will master firebase backend and flutter frondend"),
            const SizedBox(
              height: 40,
            ),
            AppCircleButton(
              onTap: () => null,
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
