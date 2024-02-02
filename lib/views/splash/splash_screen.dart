import 'package:myanmar_proverbs/views/splash/splash_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
 const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return SafeArea(
      child: Scaffold(
        
          body: controller.isLoading.value
               ?
              
             controller.SplashContainter()
              : Container()),
    );
  }
}
