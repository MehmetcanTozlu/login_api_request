import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/bindings/authController.dart';
import 'package:login_firebase/views/login.dart';

class UrunDetail extends GetWidget<AuthController> {
  final productName;
  final productCode;
  final productPrice;

  UrunDetail(
      {super.key, this.productName, this.productCode, this.productPrice});

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  var _counterState = 1.obs;

  arttir() {
    _counterState.value += 1;
  }

  azalt() {
    _counterState.value -= 1;
  }

  @override
  Widget build(BuildContext context) {
    var resultPrice = productPrice! * _counterState.value;
    String resultPrice2 = resultPrice.toStringAsFixed(7);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        elevation: 0.0,
        title: Text('Ürün Detayları'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          darkLightMode(),
        ],
      ),
      body: Column(
        children: <Widget>[
          upperList(),
          SizedBox(height: 20.0),
          bottomList(),
          SizedBox(height: 30.0),
          buttons(),
          SizedBox(height: 30.0),
          result(resultPrice2),
          SizedBox(height: 30.0),
          putToBucket(),
        ],
      ),
    );
  }

  Widget upperList() {
    int val = -1;
    return Container(
      height: 200.0,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Radio(
              value: 20,
              groupValue: val,
              onChanged: (value) {
                Obx(() => Text('${val = value!}'));
              },
              activeColor: Colors.cyan,
            ),
            title: Text(productName),
            subtitle: Text(productCode),
            trailing: Text(productPrice.toString()),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget bottomList() {
    return Container(
      height: 100.0,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            '${productName}',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${productCode}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            '${productPrice}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            if (_counterState.value > 0) {
              azalt();
              print('- calisti: ${_counterState.value}');
            } else if (_counterState.value <= 0) {
              Get.snackbar('Dikkat!', 'Miktar Olarak Eksiye Düşemezsiniz...',
                  snackPosition: SnackPosition.TOP);
            }
          },
          tooltip: '1 azaltılır.',
          child: Icon(
            Icons.remove,
          ),
          backgroundColor: Colors.cyan,
        ),
        Obx(
          () => Text(
            '${_counterState.value}',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            arttir();
            convert();
            print('+ calisti: ${_counterState.value.toInt()}');
          },
          tooltip: '1 arttırır.',
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Colors.cyan,
        ),
      ],
    );
  }

  convert() {
    var resultPrice = _counterState * productPrice;
    return resultPrice.toStringAsFixed(7);
  }

  Widget result(String resultPrice) {
    return Padding(
      padding: EdgeInsets.only(left: 50.0),
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            SizedBox(width: 9.0),
            Text(
              'Toplam Fiyat :  ',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10.0),
            Obx(
              () => Text(
                convert(),
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget putToBucket() {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        controller.writeFireBase(
            productName, productCode, productPrice, _counterState.value);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Container(
          height: 50.0,
          width: double.infinity - 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.cyan,
          ),
          child: Center(
            child: Text(
              'Satın Al',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signOut() {
    return MaterialButton(
      onPressed: () {
        AuthController auth = AuthController();
        auth.signOut(_email.text, _pass.text);
      },
      child: Text('Çıkış Yap'),
    );
  }

  Widget darkLightMode() {
    return Container(
      height: double.infinity,
      width: 55.0,
      child: MaterialButton(
        onPressed: () => Get.changeTheme(
          Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
        ),
        child: Icon(
          Icons.light_mode,
          size: 25.0,
        ),
      ),
    );
  }
}
