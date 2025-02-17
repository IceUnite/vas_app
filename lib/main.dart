import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vas_app/core/internal/di/sl.dart';
import 'feature/app/app.dart';

// Для использования device_preview
import 'package:device_preview/device_preview.dart';

late SharedPreferences prefs;

Future<void> main() async {
  // ‼️пиздец без инициализации префсов все нахуй падает ибо их нет в гетите
  // ‼️проебано 3 часа времени 10/02/25
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  configureDependencies();

  runApp(
    // Оборачиваем наше приложение в DevicePreview
    DevicePreview(
      enabled: false, // Включаем только в режиме разработки
      builder: (context) => const Application(),
    ),
  );
}
