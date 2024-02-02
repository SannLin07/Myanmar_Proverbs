import 'package:myanmar_proverbs/constant.dart';

import 'package:myanmar_proverbs/views/home/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());

    return WillPopScope(
        onWillPop: () async {
          onBackButtonPress();
          return false;
        },
        child: SafeArea(
          child: Scaffold(
              backgroundColor: customWhite,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                title: const Text(
                  "မြန်မာစကားပုံများ",
                  style: TextStyle(fontSize: 20),
                ),
                centerTitle: true,
                backgroundColor: customBlack,
                actions: [
                  IconButton(
                    onPressed: () {
                      controller.gotoSearch();
                    },
                    icon: const Icon(Icons.search_outlined),
                  )
                ],
              ),
              drawer: const CustomDrawer(),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'မြန်မာစကားပုံအက္ခရာစဥ်ဇယား',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Table(
                        border: TableBorder.all(),
                        children: [
                          buildRow(
                              controller.cell1, controller.onPressedFunction1),
                          buildRow(
                              controller.cell2, controller.onPressedFunction2),
                          buildRow(
                              controller.cell3, controller.onPressedFunction3),
                          buildRow(
                              controller.cell4, controller.onPressedFunction4),
                          buildRow(
                              controller.cell5, controller.onPressedFunction5),
                          buildRow(
                              controller.cell6, controller.onPressedFunction6),
                          buildRow(
                              controller.cell7, controller.onPressedFunction7),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '"မိမိကြည့်ရှုလိုသော သက်ဆိုင်ရာ အက္ခရာကိုနှိပ်၍ ရှာဖွေဖတ်ရှုနိုင်ပါသည်။"',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }

  // Function to handle back button press
  void onBackButtonPress() {
    Get.dialog(
      AlertDialog(
        title: const Text('Appplication မှထွက်မည်။!'),
        content: const Text('သေချာပါသလား။'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              SystemNavigator.pop(); // Exit the app
            },
            child: const Text(
              'လုပ်မယ်',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 229, 228, 228)),
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop(); // Dismiss the dialog
            },
            child: const Text('မလုပ်ပါ', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
