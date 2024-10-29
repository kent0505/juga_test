import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/db/prefs.dart';
import '../../core/widgets/custom_scaffold.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  void goHome() async {
    await saveOnboard().then((value) {
      if (mounted) {
        context.go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
