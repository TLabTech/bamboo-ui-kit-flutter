import 'package:flutter/material.dart';

class TBreadcrumbItem {
  final String? label;
  final VoidCallback onTap;
  final Widget? icon;

  const TBreadcrumbItem({
    this.label,
    required this.onTap,
    this.icon,
  });
}
