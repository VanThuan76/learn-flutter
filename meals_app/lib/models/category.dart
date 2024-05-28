import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.id, this.color = Colors.orange, required this.title});

  final String id;
  final String title;
  final Color color;
}
