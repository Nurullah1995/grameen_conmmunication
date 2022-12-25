import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grameern_communication/controller/medicine_list_controller.dart';
import 'package:grameern_communication/service/FakeDb.dart';
import 'package:grameern_communication/utils/constant/color.dart';
import 'package:grameern_communication/utils/constant/value.dart';

class MedicineView extends StatelessWidget {
  MedicineView({Key? key}) : super(key: key);
  final medicineCtlr = Get.put(MedicineListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  expandedHeight: 180,
                  forceElevated: true,
                  elevation: 5.0,
                  centerTitle: true,
                  title: const Text(
                    'Medicine List',
                    style: TextStyle(
                        color: primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontMedium),
                  ),
                  leading: const Icon(Icons.arrow_back_ios),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/addToCart');
                        medicineCtlr.updateTotalPrice();
                      },
                      child: Badge(
                        position: BadgePosition.topEnd(top: 2, end: -10),
                        padding: const EdgeInsets.all(7),
                        badgeContent: Obx(
                          () =>
                              Text(medicineCtlr.addToCartList.length.toString(),
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
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {
                                  print('sesarch');
                                },
                              ),
                              filled: true,
                              fillColor: searchFieldBackgroundColor,
                              hintText: "What are you looking for ?",
                              enabledBorder: const OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(screenPadding),
                  child: Text(
                    'Medicine',
                    style: TextStyle(
                        color: primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontMedium),
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                  itemBuilder: (context, int index) {
                    return IntrinsicHeight(
                      child: GestureDetector(
                        onTap: () {
                          print('clicked');
                          Get.toNamed('details',
                              arguments: medicineList[index]);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 7,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.all(screenPadding),
                                    //    color: Colors.amber,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          medicineList[index].medicineName,
                                          style: const TextStyle(
                                              fontSize: fontSmall,
                                              fontWeight: FontWeight.w600,
                                              color: primaryTextColor),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          medicineList[index]
                                              .medicineCompanyName,
                                          style: const TextStyle(
                                              fontSize: fontSmall,
                                              fontWeight: FontWeight.w300,
                                              color: secondaryTextColor),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Obx(
                                              () => Text(
                                                  "৳" +
                                                      medicineCtlr
                                                          .getMedicineList[
                                                              index]
                                                          .medicinePrice
                                                          .toString(),
                                                  style: const TextStyle(
                                                      fontSize: fontSmall,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: priceColor)),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Obx(
                                              () => Text(
                                                "৳" +
                                                    medicineCtlr
                                                        .getMedicineList[index]
                                                        .medicineDiscountPrice
                                                        .toString(),
                                                style: const TextStyle(
                                                    fontSize: fontVerySmall,
                                                    fontWeight: FontWeight.w300,
                                                    color: secondaryTextColor,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      child: GestureDetector(
                                    onTap: () {
                                      medicineCtlr.addToCartClicked(
                                          medicineCtlr.getMedicineList[index]);
                                    },
                                    child: Center(
                                      child: Obx(
                                        () => medicineCtlr
                                                .getMedicineList[index]
                                                .shouldVisible
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          medicineCtlr
                                                              .decrementQuantity(
                                                                  index);
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          size: 30,
                                                        )),
                                                    Obx(
                                                      () => Text(
                                                        medicineCtlr
                                                            .getMedicineList[
                                                                index]
                                                            .medicineQuantity
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                fontMedium),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          medicineCtlr
                                                              .incrementQuantity(
                                                                  index);
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .add_circle_outline_outlined,
                                                          size: 30,
                                                        ))
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                height: 50,
                                                color: Colors.transparent,
                                                child: const Center(
                                                  child: Text(
                                                    'Add To Cart',
                                                    style: TextStyle(
                                                        color: primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            fontVerySmall), // Text('Add To Cart',style: TextStyle(color: primaryTextColor,fontWeight: FontWeight.bold,fontSize: fontVerySmall),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ))),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, int index) {
                    return const Divider();
                  },
                  itemCount: medicineList.length,
                ))
              ],
            ),
          )),
    );
  }
}
