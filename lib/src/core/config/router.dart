import 'package:go_router/go_router.dart';

import '../../features/home/screens/home_screen.dart';
import '../../features/matches/screens/match_detail_screen.dart';
import '../../features/news/screens/news_detail_screen.dart';
import '../../features/quiz/screens/quiz_play_screen.dart';
import '../../features/splash/onboard_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../models/match_model.dart';
import '../models/news.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) => const QuizPlayScreen(),
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) => NewsDetailScreen(
        news: state.extra as News,
      ),
    ),
    GoRoute(
      path: '/match',
      builder: (context, state) => MatchDetailScreen(
        match: state.extra as MatchModel,
      ),
    ),
  ],
);
