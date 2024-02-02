import 'package:myanmar_proverbs/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'favorite_controller.dart';

class FavoriteScreen extends GetView<FavoritesController> {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    //  to listen for changes in the favoriteProverbs list
    return Obx(() {
      final favoriteProverbs = controller.proverbsController
          .getFavoriteProverbs(controller.proverbsController.proverbs);

      return SafeArea(
        child: Scaffold(
          backgroundColor: customWhite,
          appBar: AppBar(
            backgroundColor: customBlack,
            title: const Text(
              'အကြိုက်ဆုံးသော စကားပုံများ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: favoriteProverbs.isEmpty
              ? const Center(
                  child: Text(
                  'ကြိုက်နှစ်သက်သော စကားပုံမရှိသေးပါ။',
                  style: TextStyle(fontSize: 16),
                ))
              : ListView.builder(
                  controller: controller.proverbsController.scrollController,
                  itemCount: favoriteProverbs.length,
                  itemBuilder: (context, index) {
                    final proverb = favoriteProverbs[index];

                    return Slidable(
                        key: ValueKey(proverb),
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          extentRatio: 0.4,
                          dismissible: DismissiblePane(onDismissed: () {
                            controller.proverbsController.removeFavorite(
                              proverb.proverbId,
                              proverb.titleId,
                              proverb.proverbName,
                            );
                          }),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                controller.proverbsController.removeFavorite(
                                  proverb.proverbId,
                                  proverb.titleId,
                                  proverb.proverbName,
                                );
                              },
                              backgroundColor: Colors.white30,
                              foregroundColor: const Color(0xFFFE4A49),
                              icon: Icons.delete_outline,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: Card(
                          key: ValueKey(
                              "${proverb.titleId}-${proverb.proverbId}"),
                          margin: const EdgeInsets.all(8.0),
                          color: customBlack,
                          clipBehavior: Clip.hardEdge,
                          shadowColor: Colors.black54,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(
                              color: Colors.black38,
                              width: 1.0,
                            ),
                          ),
                          child: ListTile(
                            leading: Text("${(index + 1).toString()}.",
                                style: style),
                            title:
                                Text('"${proverb.proverbName}။"', style: style),
                            subtitle:
                                Text("-- ${proverb.proverbDesp}", style: style),
                          ),
                        ));
                  },
                ),
        ),
      );
    });
  }
}
