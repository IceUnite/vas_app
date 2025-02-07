import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/button_style.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import 'package:vas_app/feature/profile_page/presentation/widjets/text_block.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 400),
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
              const SizedBox(height: 10),
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
                          height: 10,
                        ),
                        const TextBlockWidget(text: 'Никита', hintText: 'Имя',),
                        const TextBlockWidget(text: 'Алексеевич', hintText: 'Фамилия',),
                        const TextBlockWidget(text: '8 903 00 00 338', hintText: 'Телефон',),
                        const TextBlockWidget(text: '', hintText: 'email',),
                        SizedBox(height: 50,),
                        ElevatedButton(
                          onPressed: (){},
                          style: AppButtonStyle.primaryStyleOrange.copyWith(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                             // backgroundColor: const WidgetStatePropertyAll(AppColors.white),
                          ),
                          child: Text(
                            'Сохранить изменения',
                            style: AppTypography.font18Regular.copyWith(
                              color: AppColors.white,


                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
