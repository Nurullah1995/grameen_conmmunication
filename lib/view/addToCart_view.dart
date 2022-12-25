import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grameern_communication/controller/medicine_list_controller.dart';
import 'package:grameern_communication/utils/constant/color.dart';
import 'package:grameern_communication/utils/constant/value.dart';
import 'package:grameern_communication/utils/widget.dart';

class AddToCartView extends StatelessWidget {
  AddToCartView({Key? key}) : super(key: key);
  final addToCardCtlr = Get.find<MedicineListController>();
  TextEditingController promoCtlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text('My Cart'),
          actions: [
            Badge(
              position: BadgePosition.topEnd(top: 2, end: -10),
              padding: const EdgeInsets.all(7),
              badgeContent: Obx(
                () => Text(addToCardCtlr.addToCartList.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    )),
              ),
              badgeColor: baseColor,
              child: const Icon(Icons.shopping_cart),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: const EdgeInsets.all(screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ePharma',
                          style: TextStyle(
                              color: primaryTextColor,
                              fontSize: fontMediumExtra,
                              fontWeight: FontWeight.w600),
                        ),
                        Image.asset(
                          'assets/epharma.png',
                          height: 40,
                          width: 100,
                        ),
                      ],
                    ),
                    Divider(
                      color: secondaryTextColor.withAlpha(70),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/medicine.png',
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Medicines',
                          style: TextStyle(
                              color: primaryTextColor,
                              fontSize: fontMedium,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Divider(
                      color: secondaryTextColor.withAlpha(70),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Container(
                              // height: 20,
                              // color: Colors.blue,
                              child: const Text(
                                'Type - Item',
                                style: TextStyle(color: secondaryTextColor),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Container(
                              // height: 20,
                              // color: Colors.green,
                              child: const Text(
                                'QTY',
                                style: TextStyle(color: secondaryTextColor),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              // height: 20,
                              // color: Colors.red,
                              child: const Text(
                                'Price (tk)',
                                style: TextStyle(color: secondaryTextColor),
                                textAlign: TextAlign.right,
                              ),
                            ))
                      ],
                    ),
                    Expanded(
                      child: Container(
                        //   color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < addToCardCtlr.addToCartList.length;
                                i++)
                              Container(
                                height: 60,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                          // height: 20,
                                          // color: Colors.blue,
                                          child: Text(
                                            addToCardCtlr
                                                .addToCartList[i].medicineName,
                                            style: const TextStyle(
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                            // height: 20,
                                            // color: Colors.green,
                                            // child: Text('QTY',style: TextStyle(color: secondaryTextColor),),
                                            alignment: Alignment.center,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      addToCardCtlr
                                                          .decrementQuantity(i);
                                                    },
                                                    icon: const Icon(Icons
                                                        .remove_circle_outline)),
                                                Obx(
                                                  () => Text(
                                                    addToCardCtlr
                                                        .getMedicineList[i]
                                                        .medicineQuantity
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: fontMedium,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      addToCardCtlr
                                                          .incrementQuantity(i);
                                                    },
                                                    icon: const Icon(Icons
                                                        .add_circle_outline_outlined)),
                                              ],
                                            ))),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            // height: 20,
                                            // color: Colors.red,
                                            child: Obx(
                                          () => Text(
                                            '৳' +
                                                addToCardCtlr.getMedicineList[i]
                                                    .medicinePrice
                                                    .toString(),
                                            style: const TextStyle(
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.right,
                                          ),
                                        ))),
                                  ],
                                ),
                              ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Medicine Total',
                                  style: TextStyle(color: secondaryTextColor),
                                ),
                                Obx(
                                  () => Text(
                                    '৳' + addToCardCtlr.total_price.toString(),
                                    style: const TextStyle(
                                        color: secondaryTextColor,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Vendor Total',
                                  style: TextStyle(color: secondaryTextColor),
                                ),
                                Obx(
                                  () => Text(
                                    '৳' + addToCardCtlr.total_price.toString(),
                                    style: const TextStyle(
                                        color: secondaryTextColor,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                        'Order Summary - ' +
                            addToCardCtlr.addToCartList.length.toString() +
                            ' Items',
                        style: const TextStyle(
                            color: primaryTextColor,
                            fontWeight: FontWeight.bold)),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vendor Total',
                          style: TextStyle(color: secondaryTextColor),
                        ),
                        Obx(
                          () => Text(
                            '৳' + addToCardCtlr.total_price.toString(),
                            style: const TextStyle(
                                color: secondaryTextColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Promo',
                          style: TextStyle(color: secondaryTextColor),
                        ),
                        GestureDetector(
                          onTap: () {
                            openDialog();
                          },
                          child: Obx(() => Text(
                                addToCardCtlr.applyPromo <= 0.0
                                    ? 'Apply Now'
                                    : 'Applied  ৳' +
                                        addToCardCtlr.applyPromo.toString(),
                                style: const TextStyle(
                                    color: primaryButtonColor,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Saved',
                          style: TextStyle(color: secondaryTextColor),
                        ),
                        Obx(
                          () => Text(
                            '৳' + addToCardCtlr.applyPromo.toString(),
                            style: const TextStyle(
                                color: secondaryTextColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Payable',
                          style: TextStyle(
                              color: primaryTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(
                          () => Text(
                            '৳' +
                                (addToCardCtlr.total_price.value -
                                        addToCardCtlr.applyPromo.value)
                                    .toString(),
                            style: const TextStyle(
                                color: primaryTextColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            //  height: 56,
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => GestureDetector(
                      onTap: () {
                        openDialog();
                      },
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/appli_promo_icon.png',
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            addToCardCtlr.applyPromo <= 0.0
                                ? 'Apply promo code'
                                : 'Promo applied  ৳' +
                                    addToCardCtlr.applyPromo.toString(),
                            style: const TextStyle(color: secondaryTextColor),
                          ),
                        ],
                      ),
                    )),
                const Divider(),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Payable:',
                            style: TextStyle(color: secondaryTextColor),
                          ),
                          Obx(
                            () => Text(
                              '৳' +
                                  (addToCardCtlr.total_price.value -
                                          addToCardCtlr.applyPromo.value)
                                      .toString(),
                              style: const TextStyle(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontMediumExtra),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 6,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/address');
                        },
                        child: Container(
                          child: roundTextButton(
                            const Text(
                              'Checkout',
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
              ],
            )),
      ),
    );
  }

  void openDialog() {
    Get.dialog(
      AlertDialog(
        title: Image.asset(
          'assets/promo_icon.png',
          height: 80,
          width: 200,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: promoCtlr,
              decoration: const InputDecoration(
                filled: true,
                fillColor: searchFieldBackgroundColor,
                hintText: "Apply",
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/condition.PNG',
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Get.toNamed('/addToCart');
                addToCardCtlr.applyPromo.value = double.parse(promoCtlr.text);
                Get.back();
              },
              child: SizedBox(
                width: double.infinity,
                child: roundTextButton(
                  const Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                  shadowColor: Colors.transparent,
                  backgroundColor: primaryButtonColor,
                  padding: 0.0,
                  borderRadius: 5.0,
                ),
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
