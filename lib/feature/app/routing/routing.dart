part of 'path_files.dart';

class RoutePathParameters {
  static final RoutePathParameters _routePathParameters = RoutePathParameters._internal();

  factory RoutePathParameters() => _routePathParameters;

  RoutePathParameters._internal();
}

final List<StatefulShellBranch> _bottomNavBranches = <StatefulShellBranch>[
  StatefulShellBranch(
    rootLocation: RoutePath.mainScreenPath,
    name: 'home',
  ),
  StatefulShellBranch(
    rootLocation: RoutePath.orderScreenPath,
    name: 'order',
  ),
  StatefulShellBranch(
    rootLocation: RoutePath.historyScreenPath,
    name: 'history',
  ),
  StatefulShellBranch(
    rootLocation: RoutePath.profileScreenPath,
    name: 'profile',
  ),
];

class RoutesInit {
  factory RoutesInit() {
    return _instance ??= RoutesInit._();
  }

  RoutesInit._();

  static RoutesInit? _instance;
  final GoRouter router = GoRouter(
    initialLocation: RoutePath.init,
    routes: [
      GoRoute(
        path: RoutePath.init,
        name: InitScreen.name,
        builder: (context, state) => const InitScreen(),
      ),
      StatefulShellRoute(
        branches: _bottomNavBranches,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          // _appRouteSingleTone.isShowBottomBarMyAddressesPage =
          //     state.subloc == '/profile/myAddresses';
          // _appRouteSingleTone.isShowBottomBarEditAddressPage =
          //     state.subloc == '/profile/myAddresses/editAddresses';
          // _appRouteSingleTone.isMoveBottomPadding = state.subloc == '/profile';
          return ScaffoldWithNavBar(body: child);
        },
        routes: <RouteBase>[

          ///SpacePage Menu
          GoRoute(
            path: RoutePath.mainScreenPath,
            name: MainPage.name,
            builder: (context, state) => const MainPage(),
              routes: const []
          ),
          GoRoute(
            path: RoutePath.orderScreenPath,
            name: OrderPage.name,
            builder: (context, state) => const OrderPage(),
            routes: const []
          ),
          GoRoute(
            path: RoutePath.historyScreenPath,
            name: HistoryPage.name,
            builder: (context, state) => const HistoryPage(),
            routes: const []
          ),
          GoRoute(
            path: RoutePath.profileScreenPath,
            name: ProfilePage.name,
            builder: (context, state) => const ProfilePage(),
            routes: [
              GoRoute(
                  path: RoutePath.myDataPagePath,
                  name: MyDataPage.name,
                  builder: (context, state) => const MyDataPage(),
              ),
            ]
          ),
        ],
      ),
      GoRoute(
        path: RoutePath.authScreenPath,
        name: AuthPage.name,
        builder: (context, state) => const AuthPage(),
      ),
    ],
  );
}
