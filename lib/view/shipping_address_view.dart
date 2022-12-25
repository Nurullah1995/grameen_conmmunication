import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grameern_communication/controller/medicine_list_controller.dart';
import 'package:grameern_communication/utils/constant/color.dart';
import 'package:grameern_communication/utils/constant/value.dart';
import 'package:grameern_communication/utils/widget.dart';

import '../controller/shippingAddressController.dart';

class ShippingAddressView extends StatelessWidget {
   ShippingAddressView({Key? key}) : super(key: key);
  final  medicineController = Get.find<MedicineListController>();
   final shippingCtlr = Get.put(ShippingAddressController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text('Shippping Address'),
          ),
          body: Container(
             padding: const EdgeInsets.all(screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shipping Information Form',
                  style: TextStyle(color: primaryTextColor,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Name',
                          style: TextStyle(color: primaryTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Abdullah Al Noman',
                          style: TextStyle(color: secondaryTextColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Email',
                          style: TextStyle(color: primaryTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'example@gmail.com',
                          style: TextStyle(color: secondaryTextColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Address',
                          style: TextStyle(color: primaryTextColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Flat / House / Road  ',
                          style: TextStyle(color: secondaryTextColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Post',
                          style: TextStyle(color: primaryTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Post Code',
                          style: TextStyle(color: secondaryTextColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),

                const Text(
                  'Invoice information',
                  style: TextStyle(color: primaryTextColor,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Email',
                          style: TextStyle(color: primaryTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'example@gmail.com',
                          style: TextStyle(color: primaryTextColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Mobile no',
                          style: TextStyle(color: primaryTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          '+8801710000000',
                          style: TextStyle(color: secondaryTextColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
               Obx(() => CheckboxListTile(
                 contentPadding: EdgeInsets.zero,
                 title:  RichText(
                   text: TextSpan(text: 'I Agree with ',style: const TextStyle(color: secondaryTextColor), children: [
                     TextSpan(
                       text: 'Terms & Conditions', style: const TextStyle(color:primaryButtonColor,fontWeight: FontWeight.bold),
                       recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                     )
                   ]),
                 ),
                 value: shippingCtlr.shipAddressTrarmSelect.value,
                 onChanged: (newValue) {
                   shippingCtlr.shipAddressTrarmSelect.value=newValue!;
                 },
                 controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
               )),

              ],
            ),
          ),
          bottomNavigationBar: Container(
            //  height: 56,
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                    (medicineController.total_price.value -
                                        medicineController.applyPromo.value)
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
                            Get.toNamed('/payment',arguments: (medicineController.total_price.value -
                                medicineController.applyPromo.value));
                          },
                          child: Container(
                            child: roundTextButton(
                              const Text(
                                'Confirm',
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
        )
    );
  }
}
