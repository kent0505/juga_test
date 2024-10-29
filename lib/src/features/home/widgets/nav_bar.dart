import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 62,
        color: AppColors.green,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  id: 1,
                  title: 'Matches',
                  active: state is HomeInitial,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangeHomeTab(index: 0));
                  },
                ),
                _NavBarButton(
                  id: 2,
                  title: 'News',
                  active: state is HomeNews,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangeHomeTab(index: 1));
                  },
                ),
                _NavBarButton(
                  id: 3,
                  title: 'Quiz',
                  active: state is HomeQuiz,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangeHomeTab(index: 2));
                  },
                ),
                _NavBarButton(
                  id: 4,
                  title: 'Settings',
                  active: state is HomeSettings,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangeHomeTab(index: 3));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.id,
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final int id;
  final String title;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: onPressed,
      padding: 0,
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            const SizedBox(height: 6),
            SizedBox(
              height: 29,
              child: SvgPicture.asset(
                'assets/tab/tab$id.svg',
                color: active ? AppColors.main : AppColors.white,
              ),
            ),
            const Spacer(),
            TextM(
              title,
              fontSize: 11,
              fontFamily: Fonts.montserratM,
              color: active ? AppColors.main : AppColors.white,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
