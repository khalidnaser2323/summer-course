import 'package:flutter/material.dart';

class CustomCardModel {
  String title, subtitle, image;
  VoidCallback? onCardClick;
  CustomCardModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.onCardClick,
  });
}
