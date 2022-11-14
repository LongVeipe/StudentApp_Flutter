import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:student_app/configs/themes/custom_text_styles.dart';
import 'package:student_app/configs/themes/ui_parameters.dart';
import 'package:student_app/controllers/question_paper/question_paper_controller.dart';
import 'package:student_app/models/question_paper_model.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:student_app/widgets/app_icon_text.dart';
import 'package:student_app/configs/themes/app_icons.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double padding = 10;
    return InkWell(
      onTap: () {
        controller.navigateToQuestions(paper: model);
      },
      child: Container(
        padding: const EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBoderRadius,
          color: Theme.of(context).cardColor,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: Get.width * 0.15,
                    width: Get.width * 0.15,
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: model.imageUrl != null && model.imageUrl != ""
                        ? CachedNetworkImage(
                            imageUrl: model.imageUrl!,
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                                "assets/images/app_splash_logo.png"),
                          )
                        : Text(""),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: cardTileStyle(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: padding, bottom: padding * 1.5),
                        child: Text(model.description),
                      ),
                      Row(
                        children: [
                          AppIconText(
                              icon: Icon(
                                Icons.help_outline_sharp,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                '${model.questionCount} questions',
                                style: detailTextStyle.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                              )),
                          const SizedBox(
                            width: padding * 1.5,
                          ),
                          AppIconText(
                              icon: Icon(
                                Icons.timer_outlined,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                model.timeInMinutes(),
                                style: detailTextStyle.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                bottom: -padding,
                right: -padding,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(cardBorderRadius),
                            bottomRight: Radius.circular(cardBorderRadius)),
                        color: Theme.of(context).primaryColor),
                    child: const Icon(AppIcons.trophyOutLine),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
