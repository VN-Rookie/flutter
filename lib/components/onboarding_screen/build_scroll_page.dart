import 'package:flutter/material.dart';
import 'package:my_app/type/onboarding_page.dart';

Widget buildPage(OnboardingPage page) {
  return GestureDetector(
    // Make sure gestures are detected but passed through to parent PageView
    behavior: HitTestBehavior.translucent,
    // Ensure we're not handling horizontal drag ourselves
    onHorizontalDragEnd: null,
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title

          const SizedBox(height: 16),

          // Subtitle
          Text(
            page.subtitle,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Challenge description
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Text(
              page.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
