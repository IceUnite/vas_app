
import 'package:flutter/material.dart';

class Corner {
  final double value;
  final BorderRadius border;
  final Radius radius;

  const Corner(
      {required this.value, required this.border, required this.radius});
}

abstract class AppCorners {
  static const Corner r8 = Corner(
      value: 8,
      border: BorderRadius.all(Radius.circular(8)),
      radius: Radius.circular(8));

  static const Corner r10 = Corner(
      value: 10,
      border: BorderRadius.all(Radius.circular(10)),
      radius: Radius.circular(10));

  static const Corner r12 = Corner(
      value: 12,
      border: BorderRadius.all(Radius.circular(12)),
      radius: Radius.circular(12));

    static const Corner r16 = Corner(
      value: 16,
      border: BorderRadius.all(Radius.circular(16)),
      radius: Radius.circular(16));

  static const Corner r20 = Corner(
      value: 20,
      border: BorderRadius.all(Radius.circular(20)),
      radius: Radius.circular(20));

  static const Corner r24 = Corner(
      value: 24,
      border: BorderRadius.all(Radius.circular(24)),
      radius: Radius.circular(24));
  static const Corner r50 = Corner(
      value: 50,
      border: BorderRadius.all(Radius.circular(50)),
      radius: Radius.circular(50));
  static const Corner r60 = Corner(
      value: 60,
      border: BorderRadius.all(Radius.circular(60)),
      radius: Radius.circular(60));


  static final BorderRadius radius15 = BorderRadius.circular(15.0);
  static final BorderRadius radius16 = BorderRadius.circular(16.0);
  static final BorderRadius radius20 = BorderRadius.circular(20.0);
  static final BorderRadius radius10 = BorderRadius.circular(10.0);
  static final BorderRadius radius25 = BorderRadius.circular(25.0);
  static final BorderRadius radius50 = BorderRadius.circular(50.0);
  static final BorderRadius radius60 = BorderRadius.circular(60.0);
  static final BorderRadius radius5 = BorderRadius.circular(5);
}
