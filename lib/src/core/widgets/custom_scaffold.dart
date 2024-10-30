import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.settings = false,
    this.id,
  });

  final Widget body;
  final bool settings;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.main,
      body: Stack(
        children: [
          Container(
            color: settings ? const Color(0xff003A79) : AppColors.main,
          ),
          if (id != null)
            Center(
              child: SvgPicture.asset(
                'assets/bg/bg$id.svg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          body,
        ],
      ),
    );
  }
}
