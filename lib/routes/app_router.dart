import 'package:auto_route/auto_route.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hospital_riverpod/features/auth/presentation/screens/login_screen.dart';
import 'package:hospital_riverpod/features/blog/presentation/screens/blogdelete_screen.dart';
import 'package:hospital_riverpod/features/blog/presentation/screens/bloglist_screen.dart';
import 'package:hospital_riverpod/features/blog/presentation/screens/blogstore_screen.dart';
import 'package:hospital_riverpod/features/blog/presentation/screens/blogupdate_screen.dart';
import 'package:hospital_riverpod/features/landing/landing_screen.dart';
import 'package:hospital_riverpod/routes/guard/auth_guard.dart';


part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{

  AppRouter();

  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LandingRoute.page,
      initial: true,
      guards: [AuthGuard()],
      // children: [
      //   AutoRoute(page: BlogListRoute.page,),
      //   AutoRoute(page: BlogStoreRoute.page,),
      //   AutoRoute(page: BlogUpdateRoute.page,),
      //   AutoRoute(page: BlogDeleteRoute.page,),
      // ],
    ),

    AutoRoute(page: LogInRoute.page,),
    AutoRoute(page: BlogListRoute.page,),
    AutoRoute(page: BlogStoreRoute.page,),
    AutoRoute(page: BlogUpdateRoute.page,),
    AutoRoute(page: BlogDeleteRoute.page,),

  ];

}