import 'package:get/get.dart';
import 'package:internshala_assignment/controllers/destination_controller.dart';

class GetxDependencyInjector {
  void onInit() {
    Get.put(DestinationController());
  }
}
