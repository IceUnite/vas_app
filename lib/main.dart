
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vas_app/core/internal/di/sl.dart';

import 'feature/app/app.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// late SharedPreferences prefs;

Future<void> main() async {

  configureDependencies();

  runApp(const Application( ));
}