import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'cuper_button.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        CuperButton(
          onPressed: () {
            context.pop();
          },
          minSize: 50,
          child: SvgPicture.asset('assets/back.svg'),
        ),
      ],
    );
  }
}
