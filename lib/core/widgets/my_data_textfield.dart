import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/app_corners.dart';
import 'package:vas_app/core/theme/typography.dart';

class MyDataTextField extends StatelessWidget {
  final String text;
  final bool isFlag;
  // final TextEditingController textEditingController;

  const MyDataTextField({
    super.key,
    required this.text,
    required this.isFlag,

    // required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: AppColors.gray.shade30,
          borderRadius: AppCorners.radius15,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Цвет тени
              spreadRadius: 0, // Радиус размытия
              blurRadius: 1, // Радиус размытия тени
              offset: const Offset(
                0,
                2,
              ), // Смещение тени (горизонтальное, вертикальное)
            ),
          ],
        ),
        child: Row(
          children: [
            isFlag
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: AppCorners.radius25,
                    ),
                    child: SvgPicture.asset(
                      VectorAssets.icRussia,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                      clipBehavior: Clip.antiAlias,
                    ),
                  )
                : const SizedBox(),
            Flexible(
              child: TextFormField(
                // controller: textEditingController,
                initialValue: text,
                // readOnly: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // obscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
