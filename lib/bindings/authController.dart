import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/controllers/root.dart';
import 'package:login_firebase/views/login.dart';
import 'package:login_firebase/views/urunDetail.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value?.email;
  String? email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Future<void> documentReference = FirebaseFirestore.instance
          .collection('bucketAdd')
          .doc('${email}')
          .set({});
      this.email = email;
      Get.offAll(Root());
    } catch (e) {
      Get.snackbar(
        'Yeni Hesap Oluşturulurken Bir Hataya Rastlandı...',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Future<void> documentReference = FirebaseFirestore.instance
          .collection('bucketAdd')
          .doc('${email}')
          .set({});
      this.email = email;
    } catch (e) {
      Get.snackbar(
        'Giriş Yapılırken Bir Hataya Rastlandı...',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut(String email, String password) async {
    try {
      await _auth.signOut();
      Get.to(LoginPage());
    } catch (e) {
      Get.snackbar(
        'Çıkış Yapılırken Bir Hataya Rastlandı...',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Mail Başarıyla Gönderildi',
        '',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Mail Gonderilemedi!',
        '',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void writeFireBase(String productName, String productCode,
      double productPrice, var counterState) async {
    try {
      print('AuthController email: ' + email!);
      print(productName);
      print(productCode);
      print(productPrice);
      print(counterState);
      var dt = DateTime.now();
      print(dt);
      Future<void> documentReference = FirebaseFirestore.instance
          .collection('bucketAdd')
          .doc(email)
          .collection(email.toString())
          .doc(dt.toString())
          .set(
        {
          'name': '$productName',
          'code': '$productCode',
          'price': '$productPrice',
          'unit': '$counterState',
        },
      );
      Get.snackbar('Ürünün Siparişi Başarıyla Verildi...', '');
    } catch (e) {
      Get.snackbar('Hata!',
          'Ürün Satın Alırken Bir Hata İle Karşılaşıldı.\n${e.toString()}',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
