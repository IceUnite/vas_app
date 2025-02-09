import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static String name = RoutePath.profileScreenPath;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool valueSwitchButton = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  // Загрузка состояния темы из SharedPreferences
  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false; // По умолчанию светлая тема
    setState(() {
      valueSwitchButton = isDarkTheme;
    });
  }

  // Сохранение состояния темы в SharedPreferences
  Future<void> _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', value);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        final isDarkTheme = themeNotifier.isDarkTheme;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Никита Алексеевич',
              style: AppTypography.font26Regular.copyWith(
                fontWeight: FontWeight.w700,
                color: isDarkTheme ? AppColors.white : AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: AnimatedListItems(
              duration: const Duration(milliseconds: 400),
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
                _buildTextRow(
                  title: 'Моя информация',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 30),
                _buildOptionRow(
                  icon: VectorAssets.icMyData,
                  title: 'Мои данные',
                  onTap: () {
                    context.goNamed(RoutePath.myDataPagePath);
                  },
                  isDarkTheme: isDarkTheme,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Divider(),
                ),
                _buildOptionRow(
                  onTap: () {
                    context.goNamed(RoutePath.historyScreenPath);
                  },
                  icon: VectorAssets.icRefreshStory,
                  title: 'История заказов',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 30),
                _buildTextRow(
                  title: 'Настройки',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 30),
                _buildOptionRowWithSwitch(
                  icon: VectorAssets.icBell,
                  title: 'Темная тема',
                  onTap: () {
                    themeNotifier.toggleTheme();
                    setState(() {
                      valueSwitchButton = !valueSwitchButton;
                    });
                    _saveThemePreference(valueSwitchButton); // Сохраняем новый выбор темы
                  },
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 30),
                _buildTextRow(
                  title: 'Сервис',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 30),
                _buildOptionRow(
                  onTap: () {
                    context.goNamed(RoutePath.orderScreenPath);
                  },
                  icon: VectorAssets.icDoOrder,
                  title: 'Сделать заказ документа',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 30),
                _buildTextRow(
                  title: 'Аккаунт',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 30),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return _buildOptionRow(
                      onTap: () {
                        ApeironSpaceDialog.showActionDialog(context,
                            title: "Вы уверены что хотите выйти из своего аккаунта?", onPressedConfirm: () {

                        }, confirmText: "Отмена", closeText: 'Выйти', onPressedClosed: () { context.read<AuthBloc>().add(
                              ExiteEvent(),
                            );
                            context.goNamed(RoutePath.authScreenPath); });
                      },
                      icon: VectorAssets.icLogout,
                      title: 'Выйти',
                      isDarkTheme: isDarkTheme,
                    );
                  },
                ),
                const SizedBox(height: 150),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionRow({
    required String icon,
    required String title,
    required bool isDarkTheme,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                color: isDarkTheme ? AppColors.white : AppColors.black,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: isDarkTheme ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: isDarkTheme ? AppColors.white : AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRowWithSwitch({
    required String icon,
    required String title,
    required bool isDarkTheme,
    VoidCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              color: isDarkTheme ? AppColors.white : AppColors.black,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: isDarkTheme ? AppColors.white : AppColors.black,
              ),
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
            _saveThemePreference(value); // Сохраняем новый выбор темы
          },
          activeColor: AppColors.orange100,
          trackColor: AppColors.gray.shade30,
        ),
      ],
    );
  }

  Widget _buildTextRow({
    required String title,
    required bool isDarkTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: isDarkTheme ? AppColors.white : AppColors.black, // Цвет текста для темной и светлой темы
          ),
        ),
      ],
    );
  }
}
