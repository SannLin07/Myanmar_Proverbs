import 'package:myanmar_proverbs/constant.dart';
import 'package:myanmar_proverbs/views/search/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<Searchcontroller> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Searchcontroller());
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: customWhite,
          appBar: AppBar(
            backgroundColor: customBlack,
            automaticallyImplyLeading: true,
            title: const Text(
              "မြန်မာစကားပုံများ",
              style: TextStyle(fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AutoComplete(
              controllers: controller.textEditingController,
              suggestions: controller.users,
              onSelected: (String value) {
                controller.selectedUser = value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
