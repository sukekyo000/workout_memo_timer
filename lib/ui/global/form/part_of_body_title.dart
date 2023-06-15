
import 'package:flutter/material.dart';

class PartOfBodyTitle extends Container {
  PartOfBodyTitle({
    super.key,
    required String title,
  }) : super(
    color: Colors.grey.shade300,
    width: double.infinity,
    padding: const EdgeInsets.all(8),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}