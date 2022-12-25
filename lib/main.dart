import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:grameern_communication/view/addToCart_view.dart';
import 'package:grameern_communication/view/medicine_view.dart';
import 'package:grameern_communication/view/order_view.dart';
import 'package:grameern_communication/view/payment_view.dart';
import 'package:grameern_communication/view/shipping_address_view.dart';

import 'controller/binding/initinal_binding.dart';
import 'controller/medicine_list_controller.dart';
import 'view/medicine_details_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Nunito'),
     initialBinding: InitialScreenBindings(),
     initialRoute: "/",
    getPages: [
      GetPage(name: "/", page: () => MedicineView(), binding: InitialScreenBindings(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),),
      GetPage(name: "/details", page: () => MedicineDetailsView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(name: "/addToCart", page: () => AddToCartView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(name: "/address", page: () => ShippingAddressView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(name: "/payment", page: () => PaymentView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(name: "/order", page: () => OrderView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ],
    );
    }
  }