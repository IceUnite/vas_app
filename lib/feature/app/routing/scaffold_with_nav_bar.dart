part of 'path_files.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    Key? key,
    required this.body,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final Widget body;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> alpha;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 0),
    );

    alpha = Tween<double>(begin: 1, end: 1).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final StatefulShellRouteState shellState = StatefulShellRoute.of(context);
    final data = MediaQuery.of(context);
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom; // Отступ для панели навигации

    final double screenHeight = data.size.height;
    final double navBarHeight = bottomPadding > 0 ? 56.0 + bottomPadding : 56.0; // Учитываем высоту панели навигации
    final double availableHeight = screenHeight - navBarHeight; // Доступная высота для контента

    // Получаем реальный отступ от клавиатуры
    final double keyboardHeight = data.viewInsets.bottom;

    return MediaQuery(
      data: data.copyWith(
        textScaler: TextScaler.linear(data.textScaleFactor > 1.2 ? 1.2 : data.textScaleFactor),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Основной контент, выровненный по вертикали с учетом панели навигации и клавиатуры
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: navBarHeight + keyboardHeight), // Чтобы контент не перекрывался панелью и клавиатурой
                child: Container(
                  height: availableHeight - keyboardHeight, // Ограничиваем высоту контента
                  child: widget.body,
                ),
              ),
            ),

            // Панель навигации внизу
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _appRouteSingleTone.showValue == 0
                  ? Container()
                  : AnimatedOpacity(
                opacity: _appRouteSingleTone.showValue,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .04),
                        offset: Offset(0.0, -7.0),
                        blurRadius: 14,
                      )
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: BottomNavigationBar(
                    selectedLabelStyle: AppTypography.font16Regular,
                    unselectedLabelStyle: AppTypography.font16Regular,
                    unselectedItemColor: AppColors.gray.shade70,
                    selectedItemColor: AppColors.orange200,
                    backgroundColor: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.gray.shade90
                        : AppColors.white,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      ScaffoldWithNavBarTabItem(
                        rootRoutePath: RoutePath.mainScreenPath,
                        iconActive: GestureDetector(
                          onTap: () {
                            HapticFeedback.lightImpact();
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset(VectorAssets.icHomeActive),
                            ],
                          ),
                        ),
                        icon: Column(
                          children: [
                            SvgPicture.asset(VectorAssets.icHomeDeactive),
                          ],
                        ),
                        label: 'Главная',
                      ),
                      ScaffoldWithNavBarTabItem(
                        rootRoutePath: RoutePath.historyScreenPath,
                        iconActive: Column(
                          children: [
                            SvgPicture.asset(VectorAssets.icNoteBookActive),
                          ],
                        ),
                        icon: Stack(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(VectorAssets.icNoteBookDeactive),
                              ],
                            ),
                          ],
                        ),
                        label: 'Заказы',
                      ),
                      ScaffoldWithNavBarTabItem(
                        rootRoutePath: RoutePath.orderScreenPath,
                        iconActive: Column(
                          children: [
                            SvgPicture.asset(VectorAssets.icHistoryActive),
                          ],
                        ),
                        icon: Column(
                          children: [
                            SvgPicture.asset(VectorAssets.icHistoryDeactive),
                          ],
                        ),
                        label: 'История',
                      ),
                      ScaffoldWithNavBarTabItem(
                        rootRoutePath: RoutePath.profileScreenPath,
                        iconActive: Column(
                          children: [
                            SvgPicture.asset(VectorAssets.icProfileActive),
                          ],
                        ),
                        icon: Column(
                          children: [
                            SvgPicture.asset(VectorAssets.icProfileDeactive),
                          ],
                        ),
                        label: 'Профиль',
                      ),
                    ],
                    currentIndex: shellState.currentIndex,
                    onTap: (int tappedIndex) {
                      HapticFeedback.mediumImpact();
                      return shellState.goBranch(
                        navigatorKey: _bottomNavBranches[tappedIndex].navigatorKey,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
