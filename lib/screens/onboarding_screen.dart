import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/components/onboarding_screen/build_dot_indicator.dart';
import 'package:my_app/components/onboarding_screen/build_scroll_page.dart';
import 'package:my_app/config/router.dart';
import 'package:my_app/type/onboarding_page.dart';
import 'package:my_app/components/background_decorator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      subtitle: 'Sync Your Time, Master Your Life.',
      description: 'Take on daily quests and build lasting habits',
    ),
    OnboardingPage(
      subtitle: 'Monitor Your Growth.',
      description: 'Visualize your improvements and stay motivated',
    ),
    OnboardingPage(
      subtitle: 'Eliminate Distractions.',
      description: 'Concentrate on what matters most to achieve your goals',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecorator(
        child: Column(
          children: [
            // Status bar area with time and indicators
            const SizedBox(height: 20),
            //Render logo here
            Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
            Text(
              "ROUTINE RAISE",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // Main content area
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                physics: const BouncingScrollPhysics(),
                pageSnapping: true,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return buildPage(_pages[index]);
                },
              ),
            ),

            // Page indicators
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => buildDotIndicator(_currentPage, index),
                ),
              ),
            ),

            // Get Started button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < _pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    // Navigate to login screen
                    context.push(ROUTE.login);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 252, 252, 252),
                    ),
                  ],
                ),
              ),
            ),

            // Already have an account link
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Already have an account? Log In',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
