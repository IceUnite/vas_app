import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_theme.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static String name = RoutePath.profileScreenPath;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool valueSwitchButton = false;
  Key _animationKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _restartAnimation();
  }

  void _restartAnimation() {
    setState(() {
      _animationKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('Никита Алексеевич'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: AnimationLimiter(
          key: _animationKey,
          child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: InkWell(
                      onTap: (){
                        context.goNamed(RoutePath.myDataPagePath);
                      },
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
                      const SizedBox(height: 30),
                      _buildOptionRow(
                        icon: VectorAssets.icMyData,
                        title: 'Мои данные',
                        onTap: () {
                          context.goNamed(RoutePath.myDataPagePath);
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(),
                      ),
                      _buildOptionRow(
                        icon: VectorAssets.icRefreshStory,
                        title: 'История заказа документов',
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Настройки',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      _buildOptionRowWithSwitch(
                        icon: VectorAssets.icBell,
                        title: 'Уведомления',
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Сервис',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      _buildOptionRow(
                        icon: VectorAssets.icDoOrder,
                        title: 'Сделать заказ документа',
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Аккаунт',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      _buildOptionRow(
                        icon: VectorAssets.icLogout,
                        title: 'Выйти',
                        textColor: AppColors.red200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionRow({
    required String icon,
    required String title,
    VoidCallback? onTap,
    Color textColor = Colors.black,
  }) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.w400),
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
    );
  }

  Widget _buildOptionRowWithSwitch({
    required String icon,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        CupertinoSwitch(
          value: valueSwitchButton,
          onChanged: (value) {
            setState(() {
              valueSwitchButton = value;
            });
          },
          activeColor: AppColors.orange100,
          trackColor: AppColors.gray.shade30,
        ),
      ],
    );
  }
}
