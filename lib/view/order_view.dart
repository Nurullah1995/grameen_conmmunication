
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grameern_communication/utils/constant/color.dart';
import 'package:grameern_communication/utils/constant/value.dart';
import 'package:grameern_communication/utils/widget.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: const Text('Order'),
            ),
            body: Container(
              padding: const EdgeInsets.all(screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/order_successful.png',height: 150,width: 150,),
                  const SizedBox(height: 20,),
                  const Text(
                    'Order Placed Successfully',
                    style: TextStyle(
                        color: primaryTextColor, fontWeight: FontWeight.bold,fontSize: fontMedium),
                  ),
                   const SizedBox(height: 20,),
                  const Text(
                    'One of our representatives will confirm your order shortly. You will receive an invoice through SMS.',
                    style: TextStyle(
                        color: secondaryTextColor, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            bottomNavigationBar:  Container(
              height: 56,
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/');
                      },
                      child: Container(
                        child: roundTextButton(
                          const Text(
                            'Back To Home',
                            style: TextStyle(color: secondaryTextColor),
                          ),
                          shadowColor: Colors.transparent,
                          //  backgroundColor: primaryButtonColor,
                          padding: 0.0,
                          borderSideColor: secondaryTextColor,
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
                        Get.toNamed('/');
                      },
                      child: Container(
                        child: roundTextButton(
                          const Text(
                            'View Orders',
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
        )
    );
  }
}
