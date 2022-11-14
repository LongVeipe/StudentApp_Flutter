import 'package:flutter/material.dart';
import 'package:student_app/configs/themes/app_colors.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:student_app/controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(foregroundColor: onSurfaceTextColor))),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Column(
                  children: [
                    Obx(() => controller.user.value == null
                        ? const SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor),
                          )),
                    const Spacer(
                      flex: 1,
                    ),
                    _DrawerButton(
                      icon: Icons.web,
                      label: "website",
                      onPress: () => controller.website(),
                    ),
                    _DrawerButton(
                      icon: Icons.facebook,
                      label: "facebook",
                      onPress: () => controller.facebook(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: _DrawerButton(
                        icon: Icons.email,
                        label: "email",
                        onPress: () => controller.email(),
                      ),
                    ),
                    const Spacer(flex: 4,),
                    _DrawerButton(
                      icon: Icons.logout,
                      label: "logout",
                      onPress: () => controller..signOut(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {Key? key, required this.icon, required this.label, this.onPress})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPress,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(label));
  }
}
