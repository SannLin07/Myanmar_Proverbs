import 'package:myanmar_proverbs/controllers/controller.dart';
import 'package:myanmar_proverbs/views/details/details_screen.dart';
import 'package:myanmar_proverbs/views/favorites/favoritescreen.dart';
import 'package:myanmar_proverbs/views/home/home_dataList.dart';
import 'package:myanmar_proverbs/views/search/search_screen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  HomeScreenController();

  final ProverbsController proverbsController = Get.find();

  List<String> cell1 = ['က', 'ခ', 'ဂ', 'င'];
  List<String> cell2 = ['စ', 'ဆ', 'ဇ', 'ဈ'];
  List<String> cell3 = ['ည', 'တ', 'ထ', 'ဒ'];
  List<String> cell4 = ['ဓ', 'န', 'ပ', 'ဖ'];
  List<String> cell5 = ['ဗ', 'ဘ', 'မ', 'ယ'];
  List<String> cell6 = ['ရ', 'လ', 'ဝ', 'သ'];
  List<String> cell7 = ['', 'ဟ', 'အ', ''];

  List<VoidCallback> onPressedFunction1 = [
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 1,
        titlename: 'က',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 2,
        titlename: 'ခ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 3,
        titlename: 'ဂ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 4,
        titlename: 'င',
      ));
    },
  ];
  List<VoidCallback> onPressedFunction2 = [
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 6,
        titlename: 'စ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 7,
        titlename: 'ဆ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 8,
        titlename: 'ဇ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 9,
        titlename: 'ဈ',
      ));
    },
  ];
  List<VoidCallback> onPressedFunction3 = [
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 10,
        titlename: 'ည',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 16,
        titlename: 'တ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 17,
        titlename: 'ထ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 18,
        titlename: 'ဒ',
      ));
    },
  ];
  List<VoidCallback> onPressedFunction4 = [
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 19,
        titlename: 'ဓ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 20,
        titlename: 'န',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 21,
        titlename: 'ပ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 22,
        titlename: 'ဖ',
      ));
    },
  ];
  List<VoidCallback> onPressedFunction5 = [
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 23,
        titlename: 'ဗ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 24,
        titlename: 'ဘ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 25,
        titlename: 'မ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 26,
        titlename: 'ယ',
      ));
    },
  ];
  List<VoidCallback> onPressedFunction6 = [
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 27,
        titlename: 'ရ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 28,
        titlename: 'လ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 29,
        titlename: 'ဝ',
      ));
    },
    () {
      Get.to(const ProverbDetailScreen(
        titleId: 30,
        titlename: 'သ',
      ));
    },
  ];
  List<VoidCallback?> onPressedFunction7 = [
    null,
    () {
      Get.to(const ProverbDetailScreen(titleId: 31, titlename: 'ဟ'));
    },
    () {
      Get.to(const ProverbDetailScreen(titleId: 33, titlename: 'အ'));
    },
    null,
  ];

  gotoFavotire() {
    Get.to(FavoriteScreen());
  }

  gotoBack() {
    Get.back();
  }

  gotoSearch() {
    Get.to(const SearchScreen());
  }

  //test
  gotoDetails(
    String name,
    String desp,
    String titleName,
    int titleId,
    int proverbId,
  ) {
    Get.to(DetailsScreen(
      desp: desp,
      name: name,
      titleName: titleName,
      titleId: titleId,
      proverbId: proverbId,
    ));
  }
}
