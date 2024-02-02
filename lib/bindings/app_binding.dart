import 'package:myanmar_proverbs/controllers/controller.dart';
import 'package:myanmar_proverbs/views/details/details_screen_controller.dart';
import 'package:myanmar_proverbs/views/favorites/favorite_controller.dart';
import 'package:myanmar_proverbs/views/home/home_controller.dart';
import 'package:myanmar_proverbs/views/search/search_controller.dart';
import 'package:myanmar_proverbs/views/splash/splash_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProverbsController());
  }
}

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailsController());
  }
}

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoritesController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Searchcontroller());
  }
}
