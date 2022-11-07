class QuestionPaperModel {
  String id;
  String title;
  String imageUrl;
  String description;
  int timeSeconds;
  List<Question>? questions;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['Description'],
        timeSeconds = json['time_seconds'],
        questions = (json['questions'] as List)
            .map((dynamic e) => Question.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;
    if (questions != null) {
      data['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;

  Question(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  Question.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String identifier;
  String answer;

  Answers({required this.identifier, required this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}
