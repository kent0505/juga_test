import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/arrow_back_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.color,
            ),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 120,
            ),
            children: [
              _Image(news),
              const SizedBox(height: 24),
              TextB(
                news.title,
                fontSize: 32,
                fontFamily: Fonts.montserratB,
                maxLines: 10,
              ),
              const SizedBox(height: 28),
              TextR(
                news.body,
                fontSize: 16,
                fontFamily: Fonts.montserratR,
                maxLines: 200,
                color: const Color(0xffA2A5B1),
              ),
            ],
          ),
          Positioned(
            top: getStatusBar(context),
            child: const ArrowBackButton(),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image(this.news);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getWidth(context) > 600 ? 500 : 216,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.green,
          width: 4,
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: news.image,
            height: getWidth(context) > 600 ? 460 : 182,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
