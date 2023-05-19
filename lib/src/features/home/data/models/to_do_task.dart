import 'package:flutter/material.dart';

class Todo {
  String title;
  String subtitle;
  Color priotity;
  String category;
  bool isExpanded;
  Todo({
    required this.title,
    required this.subtitle,
    required this.priotity,
    required this.category,
    required this.isExpanded,
  });
}
