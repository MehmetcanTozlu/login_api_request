import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login_firebase/bindings/authController.dart';
import 'package:login_firebase/views/login.dart';

class NewPassword extends GetWidget<AuthController> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    emailField(),
                    SizedBox(height: 30.0),
                    loginButtonField(),
                  ],
                ),
              ),
            ),
          ),
          upperBar(),
        ],
      ),
    );
  }

  Widget upperBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 5.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.cyan,
                size: 26.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: _emailController,
      style: TextStyle(color: Colors.grey.shade500),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.mail, color: Colors.cyan),
        hintText: 'E-Mail',
        hintStyle: TextStyle(color: Colors.cyan),
        focusColor: Colors.cyan,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
      ),
    );
  }

  Widget loginButtonField() {
    return MaterialButton(
        onPressed: () {
          controller.resetPassword(_emailController.text);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.cyan.shade600,
          ),
          child: Center(
            child: Text(
              'Gönder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ));
  }
}
