import 'package:flutter/material.dart';

class AppImages{
  static const desert='assets/images/desert.png';
  static const salad='assets/images/salad.png';
  static const meat='assets/images/meat.png';
  static const fruit='assets/images/fruit.png';
  static const juice='assets/images/juice.png';
}

class AppImage {
  String? imagePath;
  String? label;

  AppImage({
    this.imagePath,
    this.label,
  });
}

List<AppImage> images = [
  AppImage(
    imagePath: 'assets/images/desert.png',
    label: "desert",
  ),
  AppImage(
    imagePath: 'assets/images/salad.png',
    label: "salad",
  ),
  AppImage(
    imagePath: 'assets/images/meat.png',
    label: "meat",
  ),
  AppImage(
    imagePath: 'assets/images/juice.png',
    label: "juice",
  ),
];