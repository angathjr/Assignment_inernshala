import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/destination.dart';

class DestinationController extends GetxController {
  var lakes = DestinationModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    isLoading(true);
    final jsonString = await rootBundle.loadString('assets/data.json');
    lakes.value = destinationModelFromJson(jsonString);
    isLoading(false);
  }
}
