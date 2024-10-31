import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.color,
          ),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Image.asset(
              'assets/bg/news_bg.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: getWidth(context) - 500 + getStatusBar(context),
          left: 0,
          right: 0,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.main.withOpacity(0),
                  AppColors.main.withOpacity(0.1),
                  AppColors.main.withOpacity(0.3),
                  AppColors.main.withOpacity(0.5),
                  AppColors.main.withOpacity(0.9),
                  AppColors.main,
                  AppColors.main,
                ],
              ),
            ),
          ),
        ),
        ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 55,
            vertical: 172 + getStatusBar(context),
          ),
          children: [
            const Center(
              child: Text(
                'NEWS',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 55,
                  fontFamily: Fonts.montserratM,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 26),
            ...List.generate(
              newsList.length,
              (index) {
                return NewsCard(news: newsList[index]);
              },
            ),
          ],
        ),
      ],
    );
  }
}
