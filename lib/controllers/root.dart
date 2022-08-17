import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/bindings/authController.dart';
import 'package:login_firebase/views/category.dart';
import 'package:login_firebase/views/header.dart';
import 'package:login_firebase/views/myHomePage.dart';
import '../views/urunDetail.dart';
import '../views/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthController>().user != null)
            ? MyHomePage()
            : LoginPage();
      },
    );
  }
}
