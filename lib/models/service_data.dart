import 'package:flutter/material.dart';

class Service {
  final int id;
  final String name;
  final IconData icon; // Define icon property
  bool selected;

  Service(
      {required this.id,
      required this.name,
      required this.icon,
      this.selected = false});
}
