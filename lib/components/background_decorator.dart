import 'package:flutter/material.dart';

class BackgroundDecorator extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const BackgroundDecorator({
    super.key,
    required this.child,
    this.backgroundColor = const Color(0xFFF5F0E5), // Default beige background
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}