// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quizzo/views/BottomNavigationBar/navigationbar.dart';
// import 'package:quizzo/widgets/animated_button.dart';


// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   PageController _pageController = PageController();
//   int _currentPage = 0;

//   final List<OnboardingPage> _pages = [
//     OnboardingPage(
//       description: "Create, share and play quizzes whenever and whenever you want.",
//       image: Icons.quiz,
//       color: Color(0xFFFFA63D),
//     ),
//     OnboardingPage(
//       description: "Find fun and interesting quizzes to boost up your knowledge",
//       image: Icons.school,
//       color: Color(0xFFFFA63D),
//     ),
//     OnboardingPage(
//       description: "Play and take quiz challenges to gether with your friends.",
//       image: Icons.groups,
//       color: Color(0xFFFFA63D),
//     ),
//   ];

//   void _onPageChanged(int page) {
//     setState(() {
//       _currentPage = page;
//     });
//   }

//   void _nextPage() {
//     if (_currentPage < _pages.length - 1) {
//       _pageController.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       _finishOnboarding();
//     }
//   }

//   void _skipOnboarding() {
//     _pageController.animateToPage(
//       _pages.length - 1,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   void _finishOnboarding() {
//     Get.toNamed('/accountType');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               _pages[_currentPage].color.withOpacity(0.1),
//               _pages[_currentPage].color.withOpacity(0.05),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Skip button aligned to top right
//               Align(
//                 alignment: Alignment.topRight,
//                 child: _currentPage < _pages.length - 1
//                     ? TextButton(
//                         onPressed: () => Get.toNamed('/accountType'),
//                         child: Text(
//                           'Skip',
//                           style: TextStyle(
//                             color: _pages[_currentPage].color,
//                             fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       )
//                     : SizedBox.shrink(),
//               ),

//               // Expanded PageView to fill available space
//               Expanded(
//                 child: PageView.builder(
//                   controller: _pageController,
//                   onPageChanged: _onPageChanged,
//                   itemCount: _pages.length,
//                   itemBuilder: (context, index) {
//                     return _buildPage(_pages[index]);
//                   },
//                 ),
//               ),

//               // Bottom navigation with some padding
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                 child: _buildBottomNavigation(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPage(OnboardingPage page) {
//     return Padding(
//       padding: EdgeInsets.all(40),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Icon
//           Container(
//             width: (Get.context?.isPhone ?? true) ? 200 : 300,
//             height: (Get.context?.isPhone ?? true) ? 200 : 300,
//             decoration: BoxDecoration(
//               color: page.color.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               page.image,
//               size: 150,
//               color: page.color,
//             ),
//           ),
        
//           SizedBox(height: (Get.context?.isPhone ?? true) ? 20 : 30,),
//           // Description
//           Text(
//             page.description,
//             style: TextStyle(
//               fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[600],
//               height: 1.5,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomNavigation() {
//     return Column(
//       children: [
//         // Page indicators
//         Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//           children: List.generate(
//             _pages.length,
//             (index) => _buildIndicator(index),
//           ),
//         ),
//         SizedBox(height: 20,),
//         // Next/Get Started button
//         AnimatedButton(
//           width: double.infinity,
//           height: (Get.context?.isPhone ?? true) ? 50 : 60,
//           color: _pages[_currentPage].color,
//           borderRadius: 16,
//           shadowDegree: ShadowDegree.dark,
//           duration: 100,
//           enabled: true,
//           onPressed: _nextPage,
//           child: Text(
//             _currentPage == _pages.length - 1 ? 'GET STARTED' : 'NEXT',
//             style: TextStyle(
//               color: Colors.white, 
//               fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
//               fontWeight: FontWeight.bold, 
//               fontFamily: 'Roboto',
//             ),
//           ),
//         ),
//         SizedBox(height: 25,),
//          Center(
//         child: AnimatedButton(
//           width: double.infinity,
//           height: (Get.context?.isPhone ?? true) ? 50 : 60,
//           color: Color(0XFF04A68B),
//           borderRadius: 16,
//           shadowDegree: ShadowDegree.dark,
//           duration: 100,
//           enabled: true,
//           onPressed:(){},
//           child: Text(
//             "I ALREADY HAVE AN ACCOUNT",
//             style: TextStyle(color: Colors.white, fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,fontWeight: FontWeight.bold, fontFamily: 'Roboto',),
//           ),
//         ),)

//       ],
//     );
//   }

//   Widget _buildIndicator(int index) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       margin: EdgeInsets.only(right: 8),
//       width: _currentPage == index ? 24 : 8,
//       height: 8,
//       decoration: BoxDecoration(
//         color: _currentPage == index
//             ? _pages[_currentPage].color
//             : Colors.grey[300],
//         borderRadius: BorderRadius.circular(4),
//       ),
//     );
//   }
// }

// class OnboardingPage {
//   final String? title;
//   final String description;
//   final IconData image;
//   final Color color;

//   OnboardingPage({
//     this.title,
//     required this.description,
//     required this.image,
//     required this.color,
//   });
// }
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
      image: Icons.quiz,
      color: const Color(0xFFFFA63D),
    ),
    OnboardingPage(
      description: "Find fun and interesting quizzes to boost your knowledge.",
      image: Icons.school,
      color: const Color(0xFFFFA63D),
    ),
    OnboardingPage(
      description: "Play and take quiz challenges together with your friends.",
      image: Icons.groups,
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
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    final storage = GetStorage();
    storage.write('hasSeenOnboarding', true); // Save flag
    Get.offAllNamed('/accountType'); // Navigate and remove onboarding from stack
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _pages[_currentPage].color.withOpacity(0.1),
              _pages[_currentPage].color.withOpacity(0.05),
            ],
          ),
        ),
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
          Container(
            width: (Get.context?.isPhone ?? true) ? 200 : 300,
            height: (Get.context?.isPhone ?? true) ? 200 : 300,
            decoration: BoxDecoration(
              color: page.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              page.image,
              size: 150,
              color: page.color,
            ),
          ),
          SizedBox(height: (Get.context?.isPhone ?? true) ? 20 : 30),
          Text(
            page.description,
            style: TextStyle(
              fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
              fontWeight: FontWeight.w500,
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
          borderRadius: 16,
          shadowDegree: ShadowDegree.dark,
          duration: 100,
          enabled: true,
          onPressed: _nextPage,
          child: Text(
            _currentPage == _pages.length - 1 ? 'GET STARTED' : 'NEXT',
            style: TextStyle(
              color: Colors.white,
              fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        const SizedBox(height: 25),
        Center(
          child: AnimatedButton(
            width: double.infinity,
            height: (Get.context?.isPhone ?? true) ? 50 : 60,
            color: const Color(0XFF04A68B),
            borderRadius: 16,
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
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
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
  final IconData image;
  final Color color;

  OnboardingPage({
    required this.description,
    required this.image,
    required this.color,
  });
}
