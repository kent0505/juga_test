import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_r.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextM('Matches', fontSize: 20),
      ],
    );
  }
}
