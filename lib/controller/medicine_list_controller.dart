import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grameern_communication/model/medicine_model.dart';
import 'package:grameern_communication/service/FakeDb.dart';

class MedicineListController extends GetxController {
  var getMedicineList = <Medicine>[].obs;
  var addToCartList = <Medicine>[].obs;
  double fixed_price = 0.0;
  double fixed_DiscountPrice = 0.0;
  RxDouble total_price = 0.0.obs;
  RxDouble applyPromo = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getMedicineList.value = medicineList;
    super.onInit();
  }

  addToCartClicked(Medicine medicine) {
    final foundIndex =
        addToCartList.indexWhere((element) => element.id == medicine.id);
    if (foundIndex == -1) {
      medicine.shouldVisible = true;
      addToCartList.add(medicine);
      getMedicineList.refresh();
      fixed_price = medicine.medicinePrice;
      fixed_DiscountPrice = medicine.medicineDiscountPrice;
    } else {
      Get.snackbar('This item already added', 'you cannot add this item');
    }
  }

  incrementQuantity(int index) {
    getMedicineList[index].medicineQuantity =
        getMedicineList[index].medicineQuantity + 1;
    getMedicineList[index].medicinePrice =
        fixed_price * getMedicineList[index].medicineQuantity;
    getMedicineList[index].medicineDiscountPrice =
        fixed_DiscountPrice * getMedicineList[index].medicineQuantity;
    getMedicineList.refresh();
    print(getMedicineList[index].medicineQuantity);
    updateTotalPrice();
  }

  decrementQuantity(int index) {
    if (getMedicineList[index].medicineQuantity <= 0) {
      getMedicineList[index].medicineQuantity == 0;
    } else {
      getMedicineList[index].medicineQuantity =
          getMedicineList[index].medicineQuantity - 1;
      getMedicineList[index].medicinePrice =
          fixed_price * getMedicineList[index].medicineQuantity;
      getMedicineList[index].medicineDiscountPrice =
          fixed_DiscountPrice * getMedicineList[index].medicineQuantity;
      getMedicineList.refresh();
      print(getMedicineList[index].medicineQuantity);
    }
    updateTotalPrice();
  }

  updateTotalPrice() {
    var toTal = 0.0;
    for (int i = 0; i < addToCartList.length; i++) {
      print('totalPrice${getMedicineList[i].medicinePrice}');
      toTal += getMedicineList[i].medicinePrice;
    }
    total_price.value = toTal;
  }
}
