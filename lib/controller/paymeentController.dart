import 'package:get/get.dart';
enum Bank { bkash, nogad,card }
class PaymentController extends GetxController{

  Rx<Bank>selectedBank = Bank.bkash.obs;

}