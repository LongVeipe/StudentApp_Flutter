import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_app/firebase_ref/loading_status.dart';
import 'package:student_app/firebase_ref/references.dart';
import 'package:student_app/models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // load json file and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }

    var batch = fireStore.batch();
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "question_count": paper.questions!.length,
      });
      for (var question in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: question.id);
        batch.set(questionPath, {
          "question": question.question,
          "correct_answer": question.correctAnswer,
        });
        for (var answer in question.answers) {
          batch.set(
              answerRFFromQuestionPath(
                  questionPath: questionPath,
                  answerIdentifier: answer.identifier),
              {
                "identifier": answer.identifier,
                "answer": answer.answer,
              });
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
