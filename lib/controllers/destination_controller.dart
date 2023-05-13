import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/destination.dart';

class DestinationController extends GetxController {
  var lakes = DestinationModel().obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;
  var isScrolling = false.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadData();
    scrollController.addListener(() {
      handleScroll();
    });
  }

  @override
  void onClose() {
    scrollController.removeListener(handleScroll);
    super.onClose();
  }

  void loadData() async {
    isLoading(true);
    final jsonString = await rootBundle.loadString('assets/data.json');
    lakes.value = destinationModelFromJson(jsonString);
    isLoading(false);
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void handleScroll() {
    if (scrollController.offset != scrollController.position.maxScrollExtent &&
        scrollController.offset != 0) {
      isScrolling.value = true;
    } else {
      isScrolling.value = false;
    }
  }
}
