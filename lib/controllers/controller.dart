import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/model.dart';

class ProverbsController extends GetxController {
  final proverbs = <Proverb>[].obs;
  final StreamController<List<Proverb>> _controller =
      StreamController<List<Proverb>>.broadcast();

  Stream<List<Proverb>> get filteredProverbsStream => _controller.stream;
  late final RxList<Proverb> filteredProverbs;
  final ScrollController _scrollController = ScrollController();

  //  set to store favorite proverbs
  RxSet<int> favoriteProverbIds = <int>{}.obs;
  RxBool isfavorite = false.obs;

  //Geters / Setters
  ScrollController get scrollController => _scrollController;
  @override
  void onClose() {
    _controller.close();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();

    filteredProverbs = <Proverb>[].obs;

    
    loadProverbs(); // Load proverbs during initialization
    _loadFavorites(); // Load favorites from storage during initialization
  }

  // Read local JSON
  Future<void> loadProverbs() async {
    try {
      final String data = await rootBundle.loadString('assets/simple.json');
      final List<dynamic> jsonList = json.decode(data)["Tbl_MMProverbs"];
      proverbs.value = jsonList.map((json) => Proverb.fromJson(json)).toList();
    } catch (e) {
      print('Error loading proverbs data: $e');
    }
  }

  // Function to toggle the favorite status of an proverb
  void toggleFavorite(int proverbId, int titleId, String name, String desp) {
    final id = titleId * 1000 + proverbId; // Combine titleId and proverbId
    if (favoriteProverbIds.contains(id)) {
      favoriteProverbIds.remove(id);
    } else {
      favoriteProverbIds.add(id);
    }
    isfavorite.value = favoriteProverbIds.contains(id);
    // Save  updated  favorite IDs
    _saveFavorites();
    update();
  }

  // Function to remove  favorites
  void removeFavorite(int proverbId, int titleId, String name) {
    final id = titleId * 1000 + proverbId;
    if (favoriteProverbIds.contains(id)) {
      favoriteProverbIds.remove(id);
      update();
      _saveFavorites();

      isfavorite.value = false;
    }
  }

  // Function to check  is a favorite
  bool isFavorite(int proverbId, int titleId) {
    final id = titleId * 1000 + proverbId;

    return favoriteProverbIds.contains(id);
  }

  // Function to get favorite proverbs
  List<Proverb> getFavoriteProverbs(List<Proverb> proverbs) {
    return proverbs.where((proverb) {
      final id = proverb.titleId * 1000 + proverb.proverbId;
      return favoriteProverbIds.contains(id);
    }).toList();
  }

  // Save favorite IDs to storage
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'favorite_ids', favoriteProverbIds.map((id) => id.toString()).toList());
  }

  // Load favorite IDs from storage
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList('favorite_ids');
    if (favoriteIds != null) {
      favoriteProverbIds.addAll(favoriteIds.map((id) => int.tryParse(id) ?? 0));
    }
  }

  void filterProverbs(String query) {
    filteredProverbs.clear();
    if (query.isEmpty) {
      
      _controller.sink.add(proverbs.toList());
    } else {
      
      List<Proverb> filteredList = proverbs
          .where((proverb) =>
              proverb.proverbName.startsWith(query) ||
              proverb.proverbDesp.contains(query))
          .toList();
      
      _controller.sink.add(filteredList);
    }
  }
}
