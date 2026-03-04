import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/page/main_layout.dart';
import 'package:portfolio/page/my_c_v.dart';
import 'package:portfolio/page/project_detail.dart';
import 'package:portfolio/page/projects.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MyCV(),
          ),
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Projects(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/project_detail',
      pageBuilder: (context, state) {
        final args = state.extra as ModelArgument;
        return CustomTransitionPage(
          child: ProjectDetail(args: args),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        );
      },
    ),
  ],
);
