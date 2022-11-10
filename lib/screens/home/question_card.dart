import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:student_app/models/question_paper_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 200,
                width: 200,
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                child: CachedNetworkImage(
                  imageUrl: model.imageUrl!,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/app_splash_logo.png"),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
