import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/main_screen_card.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static String name = RoutePath.mainScreenPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Главная',
              style: AppTypography.font26Regular.copyWith(fontWeight: FontWeight.w700),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              GradientBannerWidget(
                title: 'context..psyhologist',
                description: 'context..chooseFrom',
                btnText: 'context..choose',
                imagePath: "AppImages.saly",
                width: 100,
                onPress: () {
                  // context.go(AppRoute.sessionScreenRoute);
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
