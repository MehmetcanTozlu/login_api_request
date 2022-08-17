import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/bindings/authController.dart';
import 'package:login_firebase/views/newPassword.dart';

import 'urunDetail.dart';
import 'register.dart';

class LoginPage extends GetWidget<AuthController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    emailField(),
                    passwordField(),
                    SizedBox(height: 10.0),
                    loginButtonField(),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        registerTextField(),
                        forgotPasswordField(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        autocorrect: true,
        style: TextStyle(color: Colors.grey.shade500),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.cyan.shade600),
            ),
            //labelText: 'Kullanıcı Adı',
            label: Text('E-Mail'),
            labelStyle: TextStyle(
              color: Colors.cyan.shade600,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.cyan,
              size: 30.0,
            )),
        cursorHeight: 25.0,
        cursorColor: Colors.cyan.shade600,
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: _passwordController,
        autocorrect: true,
        obscureText: true,
        style: TextStyle(color: Colors.grey.shade500),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.cyan.shade600),
            ),
            //labelText: 'Kullanıcı Adı',
            label: Text('Parola'),
            labelStyle: TextStyle(
              color: Colors.cyan.shade600,
            ),
            icon: Icon(
              Icons.lock,
              color: Colors.cyan,
              size: 30.0,
            )),
        cursorHeight: 25.0,
        cursorColor: Colors.cyan.shade600,
      ),
    );
  }

  Widget loginButtonField() {
    return MaterialButton(
        onPressed: () {
          controller.login(_emailController.text, _passwordController.text);
          controller.email = _emailController.text;
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
              'Giriş Yap',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ));
  }

  Widget forgotPasswordField() {
    return MaterialButton(
      onPressed: () {
        Get.to(NewPassword());
      },
      child: Text(
        'Şifremi Unuttum',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget registerTextField() {
    return MaterialButton(
      onPressed: () {
        Get.to(Register());
      },
      child: Text(
        'Kayıt Ol',
        style: TextStyle(
          color: Colors.cyan,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
