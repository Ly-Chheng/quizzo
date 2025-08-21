import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizzo/widgets/animated_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

final List<OnboardingPage> _pages = [
  OnboardingPage(
    description: "Create, share and play quizzes whenever and wherever you want.",
    image: "https://miro.medium.com/v2/resize:fit:1400/1*fx2GTxsjhkzpJFGtZwuGIA.png",
    color: const Color(0xFFFFA63D),
  ),
  OnboardingPage(
    description: "Find fun and interesting quizzes to boost your knowledge.",
    image: "https://img.freepik.com/vecteurs-premium/concept-illustration-demarrage-personnages-lancement-fusee_269730-114.jpg",
    color: const Color(0xFFFFA63D),
  ),
  OnboardingPage(
    description: "Play and take quiz challenges together with your friends.",
    image: "https://confluence.vc/wp-content/uploads/2023/07/undraw_coffee_with_friends_3cbj.png",
    color: const Color(0xFFFFA63D),
  ),
];


  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // _finishOnboarding();
      final storage = GetStorage();
      storage.write('hasSeenOnboarding', true); // Save flag
      Get.offAllNamed('/accountType'); // Navigate and remove onboarding from stack
    }
  }

  void _finishOnboarding() {
    final storage = GetStorage();
    storage.write('hasSeenOnboarding', true); // Save flag
    Get.offAllNamed('/BottomNavigationBar'); // Navigate and remove onboarding from stack
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(Get.context!).scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: _currentPage < _pages.length - 1
                    ? TextButton(
                        onPressed: _finishOnboarding,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: _pages[_currentPage].color,
                            fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return _buildPage(_pages[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: _buildBottomNavigation(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              page.image,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 50, color: Colors.red),
            ),
          ),
                    ),
          SizedBox(height: (Get.context?.isPhone ?? true) ? 20 : 30),
          Text(
            page.description,
            style: TextStyle(
              fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
              fontFamily: 'Nunito-Bold',
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _pages.length,
            (index) => _buildIndicator(index),
          ),
        ),
        const SizedBox(height: 20),
        AnimatedButton(
          width: double.infinity,
          height: (Get.context?.isPhone ?? true) ? 50 : 60,
          color: _pages[_currentPage].color,
          borderRadius: 25,
          shadowDegree: ShadowDegree.dark,
          duration: 100,
          enabled: true,
          onPressed: _nextPage,
          child: Text(
            _currentPage == _pages.length - 1 ? 'GET STARTED' : 'NEXT',
            style: TextStyle(
              color: Colors.white,
              fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
              fontFamily: 'Nunito-Bold'
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: AnimatedButton(
            width: double.infinity,
            height: (Get.context?.isPhone ?? true) ? 50 : 60,
            color: const Color(0XFF04A68B),
            borderRadius: 25,
            shadowDegree: ShadowDegree.dark,
            duration: 100,
            enabled: true,
            onPressed: () {
              final storage = GetStorage();
              storage.write('hasSeenOnboarding', true);
              Get.offAllNamed('/HaveAccountScreen'); 
            },
            child: Text(
              "I ALREADY HAVE AN ACCOUNT",
              style: TextStyle(
                color: Colors.white,
                fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
                // fontWeight: FontWeight.bold,
                 fontFamily: 'Nunito-Bold'
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      width: _currentPage == index ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? _pages[_currentPage].color
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage {
  final String description;
   final String image;
  final Color color;

  OnboardingPage({
    required this.description,
   required this.image,
    required this.color,
  });
}
