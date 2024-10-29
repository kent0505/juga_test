import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 18 + getStatusBar(context)),
        const Center(
          child: Text(
            'SETTINGS',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 32,
              fontWeight: FontWeight.w800,
              fontFamily: Fonts.heavy,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SettingsTile(
                id: 1,
                title: 'Privacy Policy',
                onPressed: () {},
              ),
              const _Divider(),
              _SettingsTile(
                id: 2,
                title: 'Share with friends',
                onPressed: () {},
              ),
              const _Divider(),
              _SettingsTile(
                id: 3,
                title: 'Terms of use',
                onPressed: () {},
              ),
              const _Divider(),
              _SettingsTile(
                id: 4,
                title: 'Subscription info',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: onPressed,
      minSize: 50,
      child: Row(
        children: [
          const SizedBox(width: 30),
          SvgPicture.asset('assets/settings$id.svg'),
          const SizedBox(width: 10),
          TextB(
            title,
            fontSize: 12,
            fontFamily: Fonts.montserratB,
            color: AppColors.green,
          ),
          const Spacer(),
          const Icon(
            Icons.chevron_right,
            color: AppColors.green,
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.white30,
    );
  }
}
