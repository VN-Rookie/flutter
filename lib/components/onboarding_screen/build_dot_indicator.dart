import 'package:flutter/material.dart';

Widget buildDotIndicator(int currentPage, int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: currentPage == index ? Colors.black : Colors.grey.shade300,
    ),
  );
}
