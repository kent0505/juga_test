import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getWidth(context) > 600 ? 500 : 292,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 45),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.green,
          width: 4,
        ),
      ),
      child: CuperButton(
        onPressed: () {
          context.push('/news', extra: news);
        },
        child: Column(
          children: [
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: news.image,
                height: getWidth(context) > 600 ? 360 : 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            const TextR(
              'News',
              fontSize: 18,
              fontFamily: Fonts.montserratR,
              color: AppColors.black,
            ),
            const Spacer(),
            TextB(
              news.title,
              fontSize: 18,
              fontFamily: Fonts.montserratB,
              color: AppColors.black,
              maxLines: 3,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
