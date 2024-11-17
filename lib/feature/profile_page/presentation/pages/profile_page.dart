import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/widgets/default_app_bar.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String name = RoutePath.profileScreenPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Никита Алексеевич',
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
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
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 25.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Моя информация',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
