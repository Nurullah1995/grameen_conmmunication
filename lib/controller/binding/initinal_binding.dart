
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:grameern_communication/controller/medicine_list_controller.dart';

class InitialScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<MedicineListController>(MedicineListController());
  }
}