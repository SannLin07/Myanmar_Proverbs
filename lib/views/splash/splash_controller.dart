import 'package:myanmar_proverbs/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();
  final _isLoading = false.obs; // RxBool

  RxBool get isLoading => _isLoading; // RxBool

  @override
  onInit() {
    super.onInit();
    _setup();
  }

  _setup() async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 1500), () {
      gotoHome();
      isLoading.value = false;
    });
  }

  void gotoHome() {
    Get.to(const HomeScreen());
  }

  Widget SplashContainter() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 55, 64, 72), Color.fromARGB(255, 22, 34, 33),Color.fromARGB(255, 29, 27, 27)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            
            Text(
              "မြန်မာစကားပုံများ စုစည်းရာ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
