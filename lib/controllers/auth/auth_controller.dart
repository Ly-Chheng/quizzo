import 'package:get/get.dart';
import 'package:quizzo/core/functions/local_storage.dart';

class AuthController extends GetxController {
  // Observables (reactive variables)
  var isLoggedIn = false.obs;
  var token = ''.obs;

  Future<void> login(String email, String password) async {
    // Example: Fake login (later connect to API)
    if (email == "test@test.com" && password == "123456") {
      token.value = "FAKE_TOKEN";
      isLoggedIn.value = true;

      // Save token in local storage
      await LocalStorage.storeData(key: "FAKE_TOKEN", value: token.value);
      print("✅ Login success, token saved!");
    } else {
      isLoggedIn.value = false;
      print("❌ Invalid credentials");
    }
  }

  Future<void> logout() async {
    token.value = '';
    isLoggedIn.value = false;
    await LocalStorage.removeStorage();
    print("✅ User logged out");
  }

  Future<void> loadUser() async {
    final savedToken = await LocalStorage.getStringValue();

    if (savedToken != null) {
      token.value = savedToken;
      isLoggedIn.value = true;
    }
  }
}
