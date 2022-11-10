import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final questionPaperRF = fireStore.collection('questionPapers');
DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) => questionPaperRF.doc(paperId).collection("questions").doc(questionId);
DocumentReference answerRFFromQuestionPath({
  required DocumentReference questionPath,
  required String answerIdentifier
}) => questionPath.collection("answers").doc(answerIdentifier);

Reference get firebaseStorage => FirebaseStorage.instance.ref();