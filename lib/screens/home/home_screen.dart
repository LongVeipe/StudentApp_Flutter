import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:student_app/configs/themes/app_colors.dart';
import 'package:student_app/configs/themes/app_icons.dart';
import 'package:student_app/configs/themes/custom_text_styles.dart';
import 'package:student_app/configs/themes/ui_parameters.dart';
import 'package:student_app/controllers/question_paper/question_paper_controller.dart';
import 'package:student_app/controllers/zoom_drawer_controller.dart';
import 'package:student_app/screens/home/menu_screen.dart';
import 'package:student_app/screens/home/question_card.dart';
import 'package:student_app/widgets/app_circle_button.dart';
import 'package:student_app/widgets/content_area.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routerName = "/home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    MyZoomDrawerController myZoomDrawerController = Get.put(MyZoomDrawerController());
    return Scaffold(
      body: ZoomDrawer(
        borderRadius: 50,
        showShadow: true,
        angle: 0,
        style: DrawerStyle.Style7,
        slideWidth: MediaQuery.of(context).size.width*0.5,
        mainScreenScale: 0.4,
        controller: myZoomDrawerController.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          onTap: myZoomDrawerController.toggleDrawer,
                          child: const Icon(
                            AppIcons.menuLeft,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                AppIcons.peace,
                              ),
                              Text(
                                "hello Long",
                                style: detailTextStyle.copyWith(
                                    color: onSurfaceTextColor),
                              )
                            ],
                          ),
                        ),
                        const Text(
                          "Whath do you want to learn today??",
                          style: headerTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                          () => ListView.separated(
                              padding: UIParameters.mobileScreenPadding,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(
                                    model: questionPaperController
                                        .allPapers[index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount:
                                  questionPaperController.allPapers.length),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
