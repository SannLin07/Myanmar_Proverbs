import 'package:myanmar_proverbs/controllers/controller.dart';
import 'package:myanmar_proverbs/views/home/home_controller.dart';

import 'package:get/get.dart';

class FavoritesController extends GetxController {
  FavoritesController();

  final ProverbsController proverbsController = Get.put(ProverbsController());
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
}
