import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_theme.dart';
import 'package:vas_app/core/widgets/default_app_bar.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String name = RoutePath.profileScreenPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        titleText: 'Никита Алексеевич',
        centerTitle: true,
      ),
      body: Center(
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
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: AppColors.gray300,
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
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: AppColors.gray300,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                            'Уведомления',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      // Checkbox(value: value, onChanged: onChanged)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
