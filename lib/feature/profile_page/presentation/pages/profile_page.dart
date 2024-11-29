import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/theme_notifier.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/animated_list_item.dart';
import 'package:vas_app/core/widgets/ods_alert.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: AnimatedListItems(
          duration: const Duration(milliseconds: 1000),
          verticalOffset: 50.0,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: InkWell(
                    onTap: () {
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
            ),
            const SizedBox(height: 30),
            const Text(
              'Моя информация',
              style: TextStyle(fontSize: 18),
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
              title: 'История заказов',
            ),
            const SizedBox(height: 30),
            const Text(
              'Настройки',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            _buildOptionRowWithSwitch(
              icon: VectorAssets.icBell,
              title: 'Уведомления',
            ),
            const SizedBox(height: 30),
            _buildOptionRowWithSwitch(
              icon: VectorAssets.icBell,
              title: 'Темная тема',
              onTap: () {
                Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
              },
            ),
            const SizedBox(height: 30),
            const Text(
              'Сервис',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            _buildOptionRow(
              icon: VectorAssets.icDoOrder,
              title: 'Сделать заказ документа',
            ),
            const SizedBox(height: 30),
            const Text(
              'Аккаунт',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            _buildOptionRow(
              onTap: (){
                ApeironSpaceDialog.showActionDialog(context,
                    title: "Вы уверены что хотите выйти из своего аккаунта?",
                    onPressed: () {},
                  confirmText: "Отмена",
                  closeText: 'Выйти'
                );
              },
              icon: VectorAssets.icLogout,
              title: 'Выйти',
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionRow({
    required String icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
    VoidCallback? onTap,
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        CupertinoSwitch(
          value: valueSwitchButton,
          onChanged: (value) {
            if (onTap != null) {
              onTap();
            }
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
