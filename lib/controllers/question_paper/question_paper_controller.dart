// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_app/controllers/auth_controller.dart';
import 'package:student_app/firebase_ref/references.dart';
import 'package:student_app/models/question_paper_model.dart';
import 'package:student_app/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // List<String> imgNames = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final String? imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain = false}){
    AuthController authController = Get.find();
    if(authController.isLoggedIn()){
      if(tryAgain){
        Get.back();
      }
      else{

      }
    }
    else{
      authController.showLoginAlertDialogue();
    }
  }
}
