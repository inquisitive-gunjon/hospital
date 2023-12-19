// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BlogDeleteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogDeleteScreen(),
      );
    },
    BlogListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogListScreen(),
      );
    },
    BlogStoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogStoreScreen(),
      );
    },
    BlogUpdateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlogUpdateScreen(),
      );
    },
    LandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      final args = routeData.argsAs<LogInRouteArgs>(
          orElse: () => const LogInRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LogInScreen(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
  };
}

/// generated route for
/// [BlogDeleteScreen]
class BlogDeleteRoute extends PageRouteInfo<void> {
  const BlogDeleteRoute({List<PageRouteInfo>? children})
      : super(
          BlogDeleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogDeleteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BlogListScreen]
class BlogListRoute extends PageRouteInfo<void> {
  const BlogListRoute({List<PageRouteInfo>? children})
      : super(
          BlogListRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BlogStoreScreen]
class BlogStoreRoute extends PageRouteInfo<void> {
  const BlogStoreRoute({List<PageRouteInfo>? children})
      : super(
          BlogStoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogStoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BlogUpdateScreen]
class BlogUpdateRoute extends PageRouteInfo<void> {
  const BlogUpdateRoute({List<PageRouteInfo>? children})
      : super(
          BlogUpdateRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogUpdateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingScreen]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogInScreen]
class LogInRoute extends PageRouteInfo<LogInRouteArgs> {
  LogInRoute({
    Key? key,
    dynamic Function(bool?)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LogInRoute.name,
          args: LogInRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static const PageInfo<LogInRouteArgs> page = PageInfo<LogInRouteArgs>(name);
}

class LogInRouteArgs {
  const LogInRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final dynamic Function(bool?)? onResult;

  @override
  String toString() {
    return 'LogInRouteArgs{key: $key, onResult: $onResult}';
  }
}
