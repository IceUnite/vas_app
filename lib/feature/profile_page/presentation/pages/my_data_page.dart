import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/app_corners.dart';
import 'package:vas_app/core/theme/button_style.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/my_data_textfield.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({
    super.key,
  });

  static String name = RoutePath.myDataPagePath;

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _surnameController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();

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
      body: ListView(
        children: [
          Column(
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
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 15, right: 15),
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
                          const SizedBox(
                            height: 30,
                          ),
                          MyDataTextField(
                            text: 'Никита',
                            isFlag: false,
                            // textEditingController: _nameController,
                          ),
                          MyDataTextField(
                            text: 'Алексеевич',
                            isFlag: false,
                            // textEditingController: _surnameController,
                          ),
                          MyDataTextField(
                            text: '+7 999 999 99 99',
                            isFlag: true,
                            // textEditingController: _phoneController,
                          ),
                          MyDataTextField(
                            text: 'nikita2024@yandex.ru',
                            isFlag: false,
                            // textEditingController: _emailController,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: AppButtonStyle.primaryStyleOrange,
                              onPressed: () {},
                              child: Text(
                                'Сохранить изменения',
                                style: AppTypography.font18Regular.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                ),
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
        ],
      ),
    );
  }
}
