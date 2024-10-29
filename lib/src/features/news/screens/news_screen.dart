import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextM('News', fontSize: 20),
      ],
    );
  }
}
