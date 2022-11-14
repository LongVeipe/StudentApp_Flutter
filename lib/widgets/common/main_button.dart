import 'package:flutter/material.dart';
import 'package:student_app/configs/themes/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      this.title = "",
      required this.onTap,
      this.enabled = true,
      this.color,
      this.width,
      this.child})
      : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Color? color;
  final Widget? child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: color ?? Theme.of(context).cardColor,
      child: SizedBox(
        height: 55,
        width: double.maxFinite,
        child: InkWell(
          onTap: enabled ? onTap : null,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: child ??
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: onSurfaceTextColor),
                ),
          ),
        ),
      ),
    );
  }
}
