import 'package:get/get.dart';

class HomeController extends GetxController {
  // Banner data
  var bannerTitle = "Play quiz together with your friends now!".obs;

  // Discover quizzes
  var quizzes = [].obs;

  // Top authors
  var authors = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuizzes();
    fetchAuthors();
  }

  void fetchQuizzes() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    quizzes.value = [
      {"title": "Get Smarter with Productivity Quizzo", "questions": 16},
      {"title": "Great Ideas from Brilliant Minds", "questions": 10},
    ];
  }

  void fetchAuthors() async {
    await Future.delayed(const Duration(seconds: 1));
    authors.value = [
      {"name": "Rayford"},
      {"name": "Willard"},
      {"name": "Hannah"},
      {"name": "Geoffrey"},
    ];
  }
}
