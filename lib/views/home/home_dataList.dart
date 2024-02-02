import 'package:myanmar_proverbs/constant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'home_controller.dart';

class ProverbDetailScreen extends GetView<HomeScreenController> {
  final int titleId;
  final String titlename;

  const ProverbDetailScreen(
      {super.key, required this.titleId, required this.titlename});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: customWhite,
        appBar: AppBar(
          backgroundColor: customBlack,
          title: Text("($titlename) နှင့်သက်ဆိုင်သော စကားပုံများ",
              style: const TextStyle(fontSize: 16)),
        ),
        body: GetBuilder<HomeScreenController>(
          builder: (controller) {
            final selectedProverbs = controller.proverbsController.proverbs
                .where((proverb) => proverb.titleId == titleId)
                .toList();

            return selectedProverbs.isEmpty
                ? Center(child: Text(titlename.toString()))
                : Container(
                    margin: const EdgeInsets.all(10),
                    child: ListView.builder(
                      controller:
                          controller.proverbsController.scrollController,
                      itemCount: selectedProverbs.length,
                      itemBuilder: (context, index) {
                        final proverb = selectedProverbs[index];

                        return Slidable(
                          key: ValueKey(proverb),
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            extentRatio: 0.4,
                            children: [
                              Obx(
                                () => SlidableAction(
                                  onPressed: (context) {
                                    if (controller.proverbsController
                                        .isFavorite(
                                            proverb.proverbId, titleId)) {
                                      // Remove from favorites
                                      controller.proverbsController
                                          .removeFavorite(proverb.proverbId,
                                              titleId, proverb.proverbName);
                                    } else {
                                      // Add to favorites
                                      controller.proverbsController
                                          .toggleFavorite(
                                              proverb.proverbId,
                                              titleId,
                                              proverb.proverbName,
                                              proverb.proverbDesp);
                                    }
                                  },
                                  backgroundColor: Colors.white30,
                                  foregroundColor: controller.proverbsController
                                          .isFavorite(
                                              proverb.proverbId, titleId)
                                      ? Colors.red
                                      : null,
                                  icon: controller.proverbsController
                                          .isFavorite(
                                              proverb.proverbId, titleId)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  label: 'Favorite',
                                ),
                              )
                            ],
                          ),
                          child: Card(
                            key: ValueKey(proverb.proverbId),
                            margin: const EdgeInsets.all(8.0),
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
                              onTap: () {
                                controller.gotoDetails(
                                    proverb.proverbName.toString(),
                                    proverb.proverbDesp.toString(),
                                    titlename.toString(),
                                    proverb.titleId,
                                    proverb.proverbId);
                              },
                              leading: Text("${proverb.proverbId.toString()}.",
                                  style: style),
                              title: Text('"${proverb.proverbName}။"',
                                  style: style),
                            ),
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
