import 'package:get/get.dart';
import 'package:login_firebase/bindings/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
