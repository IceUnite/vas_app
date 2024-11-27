part of 'path_files.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  /// Constructs an [ScaffoldWithNavBar].
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
      duration: const Duration(
        milliseconds: 0,
      ),
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
  void didUpdateWidget(covariant ScaffoldWithNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  String prevLocation = '';

  @override
  Widget build(BuildContext context) {
    final StatefulShellRouteState shellState = StatefulShellRoute.of(context);
    _appRouteSingleTone.showBottomNavigationBar(alpha.value);

    final data = MediaQuery.of(context);

    return MediaQuery(
      data: data.copyWith(
        textScaler: TextScaler.linear(data.textScaleFactor > 1.2 ? 1.2 : data.textScaleFactor),
      ),
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom,
              ),
              child: widget.body,
            );
          },
        ),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        bottomNavigationBar: _appRouteSingleTone.showValue == 0
            ? null
            :
        AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return AnimatedOpacity(
                    opacity: _appRouteSingleTone.showValue,
                    duration: const Duration(milliseconds: 300),
                    child: Container(

                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .04),
                            offset: Offset(0.0, -7.0), //(x,y)
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
                        type: BottomNavigationBarType.fixed,
                        items: [
                          ScaffoldWithNavBarTabItem(
                            rootRoutePath: RoutePath.mainScreenPath,
                            iconActive: GestureDetector(
                              onTap: () {
                                HapticFeedback.lightImpact();
                              },
                              onDoubleTap: () {},
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    VectorAssets.icHomeActive,
                                    // color: AppColors.green,
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
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
                            iconActive:Column(
                              children: [
                                SvgPicture.asset(
                                  VectorAssets.icNoteBookActive,
                                  // color: AppColors.green,
                                ),
                                const SizedBox(
                                  height: 0,
                                ),
                              ],
                            ),
                            icon: Stack(
                              children: [
                                Column(
                                  children: [
                                    SvgPicture.asset(VectorAssets.icNoteBookDeactive),
                                    const SizedBox(
                                      height: 0,
                                    )
                                  ],
                                ),
                                // Positioned.fill(
                                //   child: Align(
                                //     alignment: Alignment.topRight,
                                //     child: CircleAvatar(
                                //       radius: 7,
                                //       backgroundColor: AppColors.green,
                                //       child: Center(
                                //           child: Text(
                                //             '2',
                                //             style: AppTypography.font10Regular
                                //                 .copyWith(color: AppColors.white),
                                //           )),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            label: 'Заказы',
                          ),
                          ScaffoldWithNavBarTabItem(
                            rootRoutePath: RoutePath.orderScreenPath,
                            iconActive: Column(
                              children: [
                                SvgPicture.asset(
                                  VectorAssets.icHistoryActive,
                                  // color: AppColors.green,
                                ),
                                const SizedBox(
                                  height: 0,
                                )
                              ],
                            ),
                            icon: Stack(
                              children: [
                                Column(
                                  children: [
                                    SvgPicture.asset(VectorAssets.icHistoryDeactive),
                                    const SizedBox(
                                      height: 0,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            label: 'История',
                          ),
                          ScaffoldWithNavBarTabItem(
                            rootRoutePath: RoutePath.profileScreenPath,
                            iconActive: Column(
                              children: [
                                SvgPicture.asset(
                                  VectorAssets.icProfileActive,
                                  // color: AppColors.green,
                                ),
                                const SizedBox(
                                  height: 0,
                                )
                              ],
                            ),
                            icon: Column(
                              children: [
                                SvgPicture.asset(VectorAssets.icProfileDeactive),
                                const SizedBox(
                                  height: 0,
                                )
                              ],
                            ),
                            label: 'Профиль',
                          ),
                        ],
                        currentIndex: shellState.currentIndex,
                        onTap: (int tappedIndex) async {
                          if (_bottomNavBranches[tappedIndex].name ==
                              'profile') {}

                          ///Проверка через чтобы каждый раз обновлять страницу чтобы при переключение через меню
                          /// вручную закрыывать страницу результатов
                          HapticFeedback.mediumImpact();
                          return shellState.goBranch(
                            navigatorKey:
                                _bottomNavBranches[tappedIndex].navigatorKey,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
