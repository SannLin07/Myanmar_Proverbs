import 'package:myanmar_proverbs/constant.dart';
import 'package:myanmar_proverbs/controllers/controller.dart';
import 'package:myanmar_proverbs/models/model.dart';
import 'package:myanmar_proverbs/views/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchcontroller extends GetxController {
  Searchcontroller();
  final HomeScreenController homecontroller = Get.find();
  final formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  late Autocomplete autocomplete;
  final ProverbsController proverbsController = Get.find();
  String selectedUser = '';

  // Simulated list of users
  List<String> users = [
    'က',
    'ခ',
    'ဂ',
    'င',
    'စ',
    'ဆ',
    'ဇ',
    'ဈ',
    'ည',
    'တ',
    'ထ',
    'ဒ',
    'ဓ',
    'န',
    'ပ',
    'ဖ',
    'ဗ',
    'ဘ',
    'မ',
    'ယ',
    'ရ',
    'လ',
    'ဝ',
    'သ',
    'ဟ',
    'အ'
  ];
  @override
  void onInit() {
    focusNode;
    addListener(() {
      textEditingController.text;
    });
    print(users.length);
    super.onInit();
  }

  @override
  void onClose() {
    focusNode;
    textEditingController;
    super.onClose();
  }
}

//!AutoComplete Class
class AutoComplete extends GetView<Searchcontroller> {
  final TextEditingController controllers;
  final List<String> suggestions;

  final ValueChanged<String> onSelected;

  const AutoComplete(
      {super.key,
      required this.controllers,
      required this.suggestions,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controllers,
          focusNode: controller.focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            labelText: "စကားပုံများရှာရန်",
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon((Icons.search_outlined)),
            suffixIconColor: Colors.black,
          ),
          onChanged: (value) {
            controller.proverbsController.filterProverbs(value);
          },
        ),
        Expanded(
          child: StreamBuilder<List<Proverb>>(
            stream: controller.proverbsController.filteredProverbsStream,
            initialData: controller.proverbsController.proverbs.toList(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    '"${controller.textEditingController.text}" နှင့်သက်ဆိုင်သော စကားပုံမရှိပါ။',
                  ),
                );
              }

              return Container(
                color: Colors.white,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Colors.black,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Proverb proverb = snapshot.data![index];
                    return Card(
                      color: customBlack,
                      clipBehavior: Clip.hardEdge,
                      shadowColor: Colors.black54,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                          color: Color.fromARGB(96, 13, 27, 148),
                          width: 1.0,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          proverb.proverbName,
                          style: TextStyle(color: customWhite),
                        ),
                        subtitle: Text(
                          "- ${proverb.proverbDesp}",
                          style: TextStyle(color: customWhite),
                        ),
                        onTap: () {
                          controller.textEditingController.text =
                              proverb.proverbName;
                          controller.proverbsController
                              .filterProverbs(proverb.proverbName);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
