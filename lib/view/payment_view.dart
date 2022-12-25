import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grameern_communication/controller/medicine_list_controller.dart';
import 'package:grameern_communication/controller/paymeentController.dart';
import 'package:grameern_communication/utils/constant/value.dart';
import 'package:grameern_communication/utils/widget.dart';

import '../utils/constant/color.dart';

class PaymentView extends StatelessWidget {
   PaymentView({Key? key}) : super(key: key);
   final paymentCtlr = Get.put(PaymentController());
   var paymentPrice = Get.arguments as double;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: const Text('Payement'),
            ),
            body: Container(
              padding: const EdgeInsets.all(screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'You are buying from:',
                    style: TextStyle(
                        color: secondaryTextColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30,),
                  const Text(
                    'Diagnostics',
                    style: TextStyle(
                        color: secondaryTextColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                  '৳'+ paymentPrice.toString(),
                    style: const TextStyle(
                        color: primaryButtonColor, fontWeight: FontWeight.bold,fontSize: 36),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    '(All inclusive)',
                    style: TextStyle(
                        color: secondaryTextColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 200,),
                  const Text(
                    'Pay via any of the below methods',
                    style: TextStyle(
                        color: secondaryTextColor, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: (){
                      paymentCtlr.selectedBank.value=Bank.bkash;
                    },
                    child: Row(
                      children: [
                       Obx(() => Radio<Bank>(
                         value: Bank.bkash,
                         groupValue: paymentCtlr.selectedBank.value,
                         onChanged: (Bank? value) {
                           paymentCtlr.selectedBank.value=value!;
                         },
                       ),) ,
                       Image.asset('assets/bkash.png',height: 30,width: 30,),
                        SizedBox(width: 10,),
                        const Text(
                          'bKash Payment',
                          style: TextStyle(
                              color: primaryTextColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      paymentCtlr.selectedBank.value=Bank.card;
                    },
                    child: Row(
                      children: [
                        Obx(() => Radio<Bank>(
                          value: Bank.card,
                          groupValue: paymentCtlr.selectedBank.value,
                          onChanged: (Bank? value) {
                            paymentCtlr.selectedBank.value=value!;
                          },
                        ),) ,
                        Image.asset('assets/credit_card.png',height: 30,width: 30,),
                        SizedBox(width: 10,),
                        Text(
                          'Credit/Debit Card',
                          style: TextStyle(
                              color: primaryTextColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      paymentCtlr.selectedBank.value=Bank.nogad;
                    },
                    child: Row(
                      children: [
                        Obx(() => Radio<Bank>(
                          value: Bank.nogad,
                          groupValue: paymentCtlr.selectedBank.value,
                          onChanged: (Bank? value) {
                            paymentCtlr.selectedBank.value=value!;
                          },
                        ),) ,
                        Image.asset('assets/nagad.png',height: 30,width: 30,),
                        SizedBox(width: 10,),
                        Text(
                          'Nagad Payment',
                          style: TextStyle(
                              color: primaryTextColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              //  height: 56,
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed('/order');
                },
                child: Container(
                  child: roundTextButton(
                    const Text(
                      'Pay Now',
                      style: TextStyle(color: Colors.white),
                    ),
                    shadowColor: Colors.transparent,
                    backgroundColor: primaryButtonColor,
                    padding: 0.0,
                    borderRadius: 5.0,
                  ),
                ),
              ),
            )));
  }
}
