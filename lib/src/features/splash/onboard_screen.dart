import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/db/prefs.dart';
import '../../core/utils.dart';
import '../../core/widgets/buttons/cuper_button.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_r.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int index = 1;

  String getTitle() {
    if (index == 1) {
      return 'Be in sport! All the details about football in one app.';
    }
    if (index == 2) {
      return 'Read up-to-date sports news, become a sports expert';
    }
    return 'Take part in the quiz, improve your football knowledge';
  }

  void onNext() async {
    if (index == 3) {
      await saveOnboard().then((value) {
        if (mounted) context.go('/home');
      });
    } else {
      setState(() {
        index++;
      });
    }
  }

  void onTerms() {}

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      id: index,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset('assets/onboard/onboard$index.svg'),
              const Spacer(),
              TextB(
                getTitle(),
                fontSize: 28,
                maxLines: 10,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 4),
              PrimaryButton(
                title: index == 3 ? 'START' : 'NEXT',
                onPressed: onNext,
              ),
              const SizedBox(height: 20),
              CuperButton(
                onPressed: onTerms,
                minSize: 18,
                child: TextM(
                  'Terms of Use / Privacy Policy',
                  fontSize: 14,
                  fontFamily: Fonts.montserratM,
                  color: AppColors.white40,
                ),
              ),
              SizedBox(height: 42 + getBottom(context)),
            ],
          ),
        ),
      ),
    );
  }
}
