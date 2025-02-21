// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import 'configuration.dart';
import 'logging.dart';
import 'matching.dart';
import 'misc/errors.dart';
import 'path_utils.dart';
import 'typedefs.dart';
export 'route.dart';
export 'state.dart';

/// The route configuration for GoRouter configured by the app.
class RouteConfiguration {
  /// Constructs a [RouteConfiguration].
  RouteConfiguration({
    required this.routes,
    required this.redirectLimit,
    required this.topRedirect,
    required this.navigatorKey,
  })  : assert(_debugCheckPath(routes, true)),
        assert(
            _debugVerifyNoDuplicatePathParameter(routes, <String, GoRoute>{})),
        assert(_debugCheckParentNavigatorKeys(
            routes, <GlobalKey<NavigatorState>>[navigatorKey])) {
    _cacheNameToPath('', routes);
    log.info(_debugKnownRoutes());
  }

  static bool _debugCheckPath(List<RouteBase> routes, bool isTopLevel) {
    for (final RouteBase route in routes) {
      late bool subRouteIsTopLevel;
      if (route is GoRoute) {
        if (isTopLevel) {
          assert(route.path.startsWith('/'),
              'top-level path must start with "/": $route');
        } else {
          assert(!route.path.startsWith('/') && !route.path.endsWith('/'),
              'sub-route path may not start or end with /: $route');
        }
        subRouteIsTopLevel = false;
      } else if (route is ShellRouteBase) {
        subRouteIsTopLevel = isTopLevel;
      }
      _debugCheckPath(route.routes, subRouteIsTopLevel);
    }
    return true;
  }

  // Check that each parentNavigatorKey refers to either a ShellRoute's
  // navigatorKey or the root navigator key.
  static bool _debugCheckParentNavigatorKeys(
      List<RouteBase> routes, List<GlobalKey<NavigatorState>> allowedKeys) {
    for (final RouteBase route in routes) {
      if (route is GoRoute) {
        final GlobalKey<NavigatorState>? parentKey = route.parentNavigatorKey;
        if (parentKey != null) {
          // Verify that the root navigator or a ShellRoute ancestor has a
          // matching navigator key.
          assert(
              allowedKeys.contains(parentKey),
              'parentNavigatorKey $parentKey must refer to'
              " an ancestor ShellRoute's navigatorKey or GoRouter's"
              ' navigatorKey');

          _debugCheckParentNavigatorKeys(
            route.routes,
            <GlobalKey<NavigatorState>>[
              // Once a parentNavigatorKey is used, only that navigator key
              // or keys above it can be used.
              ...allowedKeys.sublist(0, allowedKeys.indexOf(parentKey) + 1),
            ],
          );
        } else {
          _debugCheckParentNavigatorKeys(
            route.routes,
            <GlobalKey<NavigatorState>>[
              ...allowedKeys,
            ],
          );
        }
      } else if (route is ShellRoute) {
        _debugCheckParentNavigatorKeys(
          route.routes,
          <GlobalKey<NavigatorState>>[...allowedKeys..add(route.navigatorKey)],
        );
      } else if (route is StatefulShellRoute) {
        _debugCheckParentNavigatorKeys(route.routes, allowedKeys);
      }
    }
    return true;
  }

  static bool _debugVerifyNoDuplicatePathParameter(
      List<RouteBase> routes, Map<String, GoRoute> usedPathParams) {
    for (final RouteBase route in routes) {
      if (route is! GoRoute) {
        continue;
      }
      for (final String pathParam in route.pathParams) {
        if (usedPathParams.containsKey(pathParam)) {
          final bool sameRoute = usedPathParams[pathParam] == route;
          throw GoError(
              "duplicate path parameter, '$pathParam' found in ${sameRoute ? '$route' : '${usedPathParams[pathParam]}, and $route'}");
        }
        usedPathParams[pathParam] = route;
      }
      _debugVerifyNoDuplicatePathParameter(route.routes, usedPathParams);
      route.pathParams.forEach(usedPathParams.remove);
    }
    return true;
  }

  /// The list of top level routes used by [GoRouterDelegate].
  final List<RouteBase> routes;

  /// The limit for the number of consecutive redirects.
  final int redirectLimit;

  /// Top level page redirect.
  final GoRouterRedirect topRedirect;

  /// The key to use when building the root [Navigator].
  final GlobalKey<NavigatorState> navigatorKey;

  final Map<String, String> _nameToPath = <String, String>{};

  late final Set<GlobalKey<NavigatorState>> _debugAllNavigatorKeys =
      _debugAllNavigatorsRecursively(routes);

  /// Looks up the url location by a [GoRoute]'s name.
  String namedLocation(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
  }) {
    assert(() {
      log.info('getting location for name: '
          '"$name"'
          '${params.isEmpty ? '' : ', params: $params'}'
          '${queryParams.isEmpty ? '' : ', queryParams: $queryParams'}');
      return true;
    }());
    final String keyName = name.toLowerCase();
    assert(_nameToPath.containsKey(keyName), 'unknown route name: $name');
    final String path = _nameToPath[keyName]!;
    assert(() {
      // Check that all required params are present
      final List<String> paramNames = <String>[];
      patternToRegExp(path, paramNames);
      for (final String paramName in paramNames) {
        assert(params.containsKey(paramName),
            'missing param "$paramName" for $path');
      }

      // Check that there are no extra params
      for (final String key in params.keys) {
        assert(paramNames.contains(key), 'unknown param "$key" for $path');
      }
      return true;
    }());
    final Map<String, String> encodedParams = <String, String>{
      for (final MapEntry<String, String> param in params.entries)
        param.key: Uri.encodeComponent(param.value)
    };
    final String location = patternToPath(path, encodedParams);
    return Uri(
            path: location,
            queryParameters: queryParams.isEmpty ? null : queryParams)
        .toString();
  }

  static Set<GlobalKey<NavigatorState>> _debugAllNavigatorsRecursively(
      List<RouteBase> routes) {
    return routes.expand((RouteBase e) {
      if (e is GoRoute && e.parentNavigatorKey != null) {
        return <GlobalKey<NavigatorState>>{
          e.parentNavigatorKey!,
          ..._debugAllNavigatorsRecursively(e.routes)
        };
      } else if (e is ShellRoute) {
        return <GlobalKey<NavigatorState>>{
          e.navigatorKey,
          ..._debugAllNavigatorsRecursively(e.routes)
        };
      } else {
        return _debugAllNavigatorsRecursively(e.routes);
      }
    }).toSet();
  }

  /// Validates the branches of a [StatefulShellRoute].
  bool debugValidateStatefulShellBranches(
      StatefulShellRoute shellRoute, List<StatefulShellBranch> branches) {
    assert(() {
      final Set<GlobalKey<NavigatorState>> uniqueBranchNavigatorKeys =
          branches.map((StatefulShellBranch e) => e.navigatorKey).toSet();
      assert(uniqueBranchNavigatorKeys.length == branches.length,
          'StatefulShellRoute must not uses duplicate Navigator keys for the branches');

      final Set<String> uniqueDefaultLocations =
          branches.map((StatefulShellBranch e) => e.defaultLocation).toSet();
      assert(uniqueDefaultLocations.length == branches.length,
          'StatefulShellRoute must not uses duplicate defaultLocations for the branches');

      assert(
          _debugAllNavigatorKeys
              .intersection(uniqueBranchNavigatorKeys)
              .isEmpty,
          'StatefulShellBranch Navigator key must be unique');

      // Check to see that the configured defaultLocation of
      // StatefulShellBranches points to a descendant route of the route branch.
      void checkBranchDefaultLocations(
          List<RouteBase> routes, RouteMatcher matcher) {
        try {
          for (final RouteBase route in routes) {
            if (route is StatefulShellRoute) {
              for (final StatefulShellBranch branch in branches) {
                final String defaultLocation = branch.defaultLocation;
                final RouteBase defaultLocationRoute =
                    matcher.findMatch(defaultLocation).last.route;
                final RouteBase? match = shellRoute.routes.firstWhereOrNull(
                    (RouteBase e) => _debugIsDescendantOrSame(
                        ancestor: e, route: defaultLocationRoute));
                assert(
                    match != null,
                    'The defaultLocation (${branch.defaultLocation}) of '
                    'StatefulShellBranch must match a descendant route of the '
                    'StatefulShellRoute');
              }
            }
            checkBranchDefaultLocations(route.routes, matcher);
          }
        } on MatcherError catch (e) {
          assert(
              false,
              'defaultLocation (${e.location}) of StatefulShellBranch must '
              'be a valid location');
        }
      }

      checkBranchDefaultLocations(routes, RouteMatcher(this));

      return true;
    }());
    return true;
  }

  /// Tests if a route is a descendant of, or same as, an ancestor route.
  bool _debugIsDescendantOrSame(
      {required RouteBase ancestor, required RouteBase route}) {
    return _debugAncestorsForRoute(route, routes).contains(ancestor);
  }

  static List<RouteBase> _debugAncestorsForRoute<T extends RouteBase>(
      RouteBase targetRoute, List<RouteBase> routes) {
    for (final RouteBase route in routes) {
      if (route.routes.contains(targetRoute)) {
        return <RouteBase>[route, targetRoute];
      } else {
        final List<RouteBase> ancestors =
            _debugAncestorsForRoute(targetRoute, route.routes);
        if (ancestors.isNotEmpty) {
          return <RouteBase>[route, ...ancestors];
        }
      }
    }
    return <RouteBase>[];
  }

  @override
  String toString() {
    return 'RouterConfiguration: $routes';
  }

  String _debugKnownRoutes() {
    final StringBuffer sb = StringBuffer();
    sb.writeln('Full paths for routes:');
    _debugFullPathsFor(routes, '', 0, sb);

    if (_nameToPath.isNotEmpty) {
      sb.writeln('known full paths for route names:');
      for (final MapEntry<String, String> e in _nameToPath.entries) {
        sb.writeln('  ${e.key} => ${e.value}');
      }
    }

    return sb.toString();
  }

  void _debugFullPathsFor(List<RouteBase> routes, String parentFullpath,
      int depth, StringBuffer sb) {
    for (final RouteBase route in routes) {
      if (route is GoRoute) {
        final String fullpath = concatenatePaths(parentFullpath, route.path);
        sb.writeln('  => ${''.padLeft(depth * 2)}$fullpath');
        _debugFullPathsFor(route.routes, fullpath, depth + 1, sb);
      }
    }
  }

  void _cacheNameToPath(String parentFullPath, List<RouteBase> childRoutes) {
    for (final RouteBase route in childRoutes) {
      if (route is GoRoute) {
        final String fullPath = concatenatePaths(parentFullPath, route.path);

        if (route.name != null) {
          final String name = route.name!.toLowerCase();
          assert(
              !_nameToPath.containsKey(name),
              'duplication fullpaths for name '
              '"$name":${_nameToPath[name]}, $fullPath');
          _nameToPath[name] = fullPath;
        }

        if (route.routes.isNotEmpty) {
          _cacheNameToPath(fullPath, route.routes);
        }
      } else if (route is ShellRouteBase) {
        if (route.routes.isNotEmpty) {
          _cacheNameToPath(parentFullPath, route.routes);
        }
      }
    }
  }
}
