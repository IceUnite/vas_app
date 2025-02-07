import 'package:flutter/material.dart';
import 'package:vas_app/core/theme/app_colors.dart';

class TextBlockWidget extends StatelessWidget {
  final String? text;
  final String hintText;

  const TextBlockWidget({super.key, this.text, this.hintText = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: AppColors.gray.shade30,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            hintText: text == null || text!.isEmpty ? hintText : '',
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey, // Цвет хинта
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black, // Цвет введенного текста
          ),
          controller: TextEditingController(text: text),
        ),
      ),
    );
  }
}
