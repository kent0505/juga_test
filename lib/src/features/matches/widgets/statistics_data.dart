import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class StatisticsData extends StatelessWidget {
  const StatisticsData({
    super.key,
    required this.title,
    required this.left,
    required this.right,
  });

  final String title;
  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    double data1 = double.tryParse(left.replaceAll('%', '')) ?? 0;
    double data2 = double.tryParse(right.replaceAll('%', '')) ?? 0;

    double percentage1 = (data1 / data2);
    double percentage2 = (data2 / data1);
    double maxWidth = 140;
    double calculatedWidth1 = (percentage1 * maxWidth).clamp(0, maxWidth);
    double calculatedWidth2 = (percentage2 * maxWidth).clamp(0, maxWidth);

    return Center(
      child: SizedBox(
        width: 280,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextB(
                  left,
                  fontSize: 14,
                  color: AppColors.white,
                ),
                TextR(
                  title,
                  fontSize: 12,
                  color: const Color(0xffA2A5B1),
                ),
                TextB(
                  right,
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 8,
              width: 280,
              child: Stack(
                children: [
                  Container(
                    height: 8,
                    width: 280,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 140,
                    child: Container(
                      height: 8,
                      width: calculatedWidth1,
                      decoration: const BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    child: Container(
                      height: 8,
                      width: calculatedWidth2,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
