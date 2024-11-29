import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/animated_list_item.dart';
import 'package:vas_app/core/widgets/gradient_banner_widget.dart';
import 'package:vas_app/core/widgets/other_option_widget.dart';
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
          child: AnimatedListItems(
            duration: const Duration(milliseconds: 1400),
            verticalOffset: 150.0,
            children: [
              GradientBannerWidget(
                gradient: AppColors.gradientOrangeBackground,
                title: 'Быстрое оформление документов',
                description: 'Выберите из 146 образцов',
                btnText: 'Выбрать',
                imagePath: ImageAssets.saly,
                width: 100,
                onPress: () {
                  context.goNamed(RoutePath.orderScreenPath);
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
                        onTap: () {
                          context.goNamed(RoutePath.orderScreenPath);
                        },
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: OtherOptionWidget(
                        title: "История заказов",
                        subTitle: "Перейти",
                        icon: VectorAssets.icHistory,
                        onTap: () {
                          context.goNamed(RoutePath.historyScreenPath);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
