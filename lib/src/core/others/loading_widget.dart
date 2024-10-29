import 'package:flutter/cupertino.dart';

import '../config/app_colors.dart';
import '../widgets/texts/text_r.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    this.custom = false,
  });

  final bool custom;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.custom
        ? Center(
            child: RotationTransition(
              turns: controller,
              child: const TextM('Loading...', fontSize: 20),
            ),
          )
        : const Center(
            child: CupertinoActivityIndicator(
              color: AppColors.main,
            ),
          );
  }
}
