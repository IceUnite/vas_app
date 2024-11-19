import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_theme.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/main_screen_card.dart';
import 'package:vas_app/core/widgets/main_screen_other_option_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static String name = RoutePath.mainScreenPath;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Главная',
            style: AppTypography.font26Regular.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 1400),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 150.0,
                  curve: Curves.easeOut,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  GradientBannerWidget(
                    gradient: AppColors.gradientOrangeBackground,
                    title: 'Быстрое оформление документов',
                    description: 'Выберите из 146 образцов',
                    btnText: 'Выбрать',
                    imagePath: ImageAssets.saly,
                    width: 100,
                    onPress: () {
                      // context.go(AppRoute.sessionScreenRoute);
                    },
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 160,
                    child: Row(
                      children: [
                        Expanded(
                          child: OtherOptionWidget(
                            title: "Популярные документы",
                            subTitle: "Читать",
                            icon: VectorAssets.icPlansh,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: OtherOptionWidget(
                            title: "История заказов",
                            subTitle: "Перейти",
                            icon: VectorAssets.icHistory,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
