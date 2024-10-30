import 'package:flutter/cupertino.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.width,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: width,
      decoration: BoxDecoration(
        color: active ? AppColors.green : const Color(0xff9F9F9F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: TextM(
            title,
            fontSize: 22,
            fontFamily: Fonts.montserratB,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
