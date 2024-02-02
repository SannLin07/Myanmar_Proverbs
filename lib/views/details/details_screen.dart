import 'package:myanmar_proverbs/constant.dart';
import 'package:myanmar_proverbs/views/details/details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends GetView<DetailsController> {
  final String? titleName;

  final int titleId;
  final int proverbId;
  final String? name;
  final String? desp;

  const DetailsScreen({
    required this.titleName,
    required this.titleId,
    required this.proverbId,
    required this.name,
    required this.desp,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsController controller = Get.put(DetailsController());
    return SafeArea(
      child: Scaffold(
          backgroundColor: customWhite,
          appBar: AppBar(
            backgroundColor: customBlack,
            title: Text(
              "($titleName)  $name",
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              IconButton(
                icon: Obx(() {
                  final isFavorite = controller.proverbsController
                      .isFavorite(proverbId, titleId);
                  return Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  );
                }),
                onPressed: () {
                  if (controller.proverbsController
                      .isFavorite(proverbId, titleId)) {
                    // Remove from favorites
                    controller.proverbsController
                        .removeFavorite(proverbId, titleId, name!);
                  } else {
                    // Add to favorites
                    controller.proverbsController
                        .toggleFavorite(proverbId, titleId, name!, desp!);
                  }
                },
              )
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 100.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              color: customBlack,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '"$name"',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView(
                            children: [
                              Text('- $desp', style: style),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
