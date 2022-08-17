import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/bindings/authController.dart';
import 'package:login_firebase/views/urunDetail.dart';
import 'package:login_firebase/views/login.dart';

class Register extends GetWidget<AuthController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      nameField(),
                      SizedBox(height: 10.0),
                      emailField(),
                      SizedBox(height: 10.0),
                      passwordField(),
                      SizedBox(height: 10.0),
                      rePasswordField(),
                      SizedBox(height: 30.0),
                      Save(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        upperBar(context)
      ],
    ));
  }

  Widget upperBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.cyan,
                size: 26,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.3,
            ),
            Text(
              "Kayıt ol",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
        controller: _nameController,
        style: TextStyle(
          color: Colors.cyan,
        ),
        cursorColor: Colors.cyan,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.cyan,
          ),
          hintText: 'Kullanıcı adı',
          hintStyle: TextStyle(color: Colors.cyan),
          focusColor: Colors.cyan,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.cyan,
          )),
        ));
  }

  Widget emailField() {
    return TextFormField(
        controller: _emailController,
        style: TextStyle(
          color: Colors.cyan,
        ),
        cursorColor: Colors.cyan,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.mail,
            color: Colors.cyan,
          ),
          hintText: 'E-Mail',
          hintStyle: TextStyle(color: Colors.cyan),
          focusColor: Colors.cyan,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.cyan,
          )),
        ));
  }

  Widget passwordField() {
    return TextFormField(
        style: TextStyle(
          color: Colors.cyan,
        ),
        cursorColor: Colors.cyan,
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.cyan,
          ),
          hintText: 'Parola',
          hintStyle: TextStyle(color: Colors.cyan),
          focusColor: Colors.cyan,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.cyan,
          )),
        ));
  }

  Widget rePasswordField() {
    return TextFormField(
        style: TextStyle(
          color: Colors.cyan,
        ),
        cursorColor: Colors.cyan,
        controller: _passwordAgainController,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.cyan,
          ),
          hintText: 'Parola Tekrar',
          hintStyle: TextStyle(color: Colors.cyan),
          focusColor: Colors.cyan,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.cyan,
          )),
        ));
  }

  Widget Save() {
    return MaterialButton(
      onPressed: () {
        if (_passwordController.text == _passwordAgainController.text) {
          controller.createUser(
              _emailController.text, _passwordController.text);
        }
        if (_passwordController.text != _passwordAgainController.text) {
          Get.snackbar('Hata!',
              'Girilen Parolalar Birbirleriyle uyuşmuyor!\nLütfen Kontrol Edip Tekrar Deneyin...',
              snackPosition: SnackPosition.BOTTOM);
        }
      },
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.cyan, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Text(
            "Kaydet",
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 20,
            ),
          )),
        ),
      ),
    );
  }
}
