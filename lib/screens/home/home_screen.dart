import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:student_app/controllers/question_paper/question_paper_controller.dart';
import 'package:student_app/screens/home/question_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
        body: Obx(
      () => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return QuestionCard(model: questionPaperController.allPapers[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: questionPaperController.allPapers.length),
    ));
  }
}
