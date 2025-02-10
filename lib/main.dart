import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vas_app/core/internal/di/sl.dart';
import 'feature/app/app.dart';
late SharedPreferences prefs;
Future<void> main() async {

  // ‼️пиздец без инициализации префсов все нахуй падает ибо их нет в гетите
  // ‼️проебано 3 часа времени 10/02/25
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  configureDependencies();
  runApp(const Application());
}
