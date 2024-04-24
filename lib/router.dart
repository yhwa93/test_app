import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/features/authentication/login_screen.dart';
import 'package:test_app/features/authentication/sign_up_screen.dart';
import 'package:test_app/features/my/my_screen.dart';
import 'package:test_app/features/reports/report_screen.dart';
import 'package:test_app/features/reports/reportlist_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const LoginScreen(),
        transitionDuration: const Duration(
          milliseconds: 500,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/sign_up',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: SignUpScreen(),
        transitionDuration: const Duration(
          milliseconds: 500,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/my',
      builder: (context, state) {
        final tab = state.uri.queryParameters['show'];
        return MyScreen(tab!);
      },
    ),
    GoRoute(
      path: '/my/reports',
      builder: (context, state) {
        return ReportListScreen();
      },
    ),
    GoRoute(
      path: '/my/reports/:reportId',
      builder: (context, state) {
        final reportId = state.pathParameters['reportId'];
        return ReportScreen(reportId!);
      },
    ),
  ],
  // errorPageBuilder: (context, state) => MaterialPage<void>(
  //   key: state.pageKey,
  //   child: ErrorScreen(state.error),
  // ),
);
