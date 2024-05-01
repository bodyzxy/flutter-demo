import 'package:demo2/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/card.dart';
import '../pages/home.dart';
import '../pages/local.dart';
import '../pages/write.dart';

final router = GoRouter(
  initialLocation: "/card", //初次访问地址
  routes: [
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return HomePage(
            child: child,
          );
        },
        routes: <RouteBase>[
          // GoRoute(
          //   path: '/',
          //   name: 'home',
          //   builder: (context, state) => HomePage(),
          // ),
          GoRoute(
            path: '/card',
            name: 'card',
            builder: (context, state) => const CardPage(),
          ),
          GoRoute(
            path: '/local',
            name: 'local',
            builder: (context, state) => const LocalPage(),
          ),
          GoRoute(
            path: '/write',
            name: 'write',
            builder: (context, state) => WritePage(),
          ),
          GoRoute(
            path: '/details/:title/:writes',
            name: 'details',
            builder: (context, state) {
              final title = state.pathParameters['title']!;
              final writes = state.pathParameters['writes']!;
              return DetailsPage(title: title, writes: writes);
            },
          ),
        ]),
  ],
);
