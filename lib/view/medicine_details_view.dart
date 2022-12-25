import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grameern_communication/controller/medicine_list_controller.dart';
import 'package:grameern_communication/utils/constant/color.dart';
import 'package:grameern_communication/utils/constant/value.dart';
import 'package:grameern_communication/utils//widget.dart';

import '../model/medicine_model.dart';

class MedicineDetailsView extends StatelessWidget {
  MedicineDetailsView({Key? key}) : super(key: key);
  final medicineDetailsCtlr = Get.find<MedicineListController>();
  var data = Get.arguments as Medicine;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          // leading: Icon(Icons.arrow_back_ios),
          title: const Text('Product Details'),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed('/addToCart');
              },
              child: Badge(
                position: BadgePosition.topEnd(top: 2, end: -10),
                padding: const EdgeInsets.all(7),
                badgeContent: Obx(
                  () =>
                      Text(medicineDetailsCtlr.addToCartList.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                ),
                badgeColor: baseColor,
                child: const Icon(Icons.shopping_cart),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.asset(data.medicineImage),
              ),
              Row(
                children: [
                  Text("৳" + data.medicinePrice.toString(),
                      style: const TextStyle(
                          fontSize: fontMediumExtra,
                          fontWeight: FontWeight.w700,
                          color: priceColor)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "৳" + data.medicineDiscountPrice.toString(),
                    style: const TextStyle(
                        fontSize: fontVerySmall,
                        fontWeight: FontWeight.w300,
                        color: secondaryTextColor,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              Text(
                data.medicineName,
                style: const TextStyle(
                  fontSize: fontMedium,
                  fontWeight: FontWeight.w600,
                  color: primaryTextColor,
                ),
              ),
              Text(
                data.medicineCompanyName,
                style: const TextStyle(
                  fontSize: fontVerySmall,
                  fontWeight: FontWeight.w300,
                  color: secondaryTextColor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Short Description',
                  style: TextStyle(
                    fontSize: fontVerySmall,
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(data.medicineDescription),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 56,
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    medicineDetailsCtlr.addToCartClicked(data);
                  },
                  child: Container(
                    child: roundTextButton(
                      const Text(
                        'Add To Cart',
                        style: TextStyle(color: primaryButtonColor),
                      ),
                      shadowColor: Colors.transparent,
                      //  backgroundColor: primaryButtonColor,
                      padding: 0.0,
                      borderSideColor: primaryButtonColor,
                      borderRadius: 5.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/addToCart');
                  },
                  child: Container(
                    child: roundTextButton(
                      const Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      shadowColor: Colors.transparent,
                      backgroundColor: primaryButtonColor,
                      padding: 0.0,
                      borderRadius: 5.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
