import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class MyDataPage extends StatelessWidget {
  const MyDataPage({Key? key}) : super(key: key);
  static String name = RoutePath.myDataPagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Мои данные',
          style: AppTypography.font26Regular.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 1400),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            curve: Curves.easeOut,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    child: SvgPicture.asset(
                      VectorAssets.icProfileActive,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Text(
                        'Редактировать',
                        style: AppTypography.font16Regular.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.blue200,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: AppColors.gray.shade30,
                          borderRadius: BorderRadius.circular(15),
                          shape: BoxShape.rectangle,
                        ),
                        child: Text('Никита'),
                      ),
                    ],
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
