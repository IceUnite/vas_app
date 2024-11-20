import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_theme.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  static String name = RoutePath.profileScreenPath;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool valueSwitchButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Никита Алексеевич',
          style: AppTypography.font26Regular.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    child: SvgPicture.asset(
                      VectorAssets.icProfileActive,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Моя информация',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(VectorAssets.icMyData),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Мои данные',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: AppColors.gray.shade50,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(VectorAssets.icRefreshStory),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'История заказа документов',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: AppColors.gray.shade50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Настройки',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(VectorAssets.icBell),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Уведомления',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        CupertinoSwitch(
                          value: valueSwitchButton,
                          onChanged: (value) => setState(
                            () {
                              valueSwitchButton = value;
                            },
                          ),
                          activeColor: AppColors.orange100,
                          trackColor: AppColors.gray.shade30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Сервис',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(VectorAssets.icDoOrder),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Сделать заказ документа',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: AppColors.gray.shade50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Аккаунт',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(VectorAssets.icLogout),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Выйти',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.red200,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
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
