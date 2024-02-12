import 'package:flutter/material.dart';
import 'package:forestvpn_test/presentation/pages/news_list.dart';
import 'package:forestvpn_test/presentation/pages/news_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const NewsList();
      },
    ),
    // GoRoute(
    //   path: '/newsPage',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const NewsPage();
    //   },
    // ),
  ],
);
