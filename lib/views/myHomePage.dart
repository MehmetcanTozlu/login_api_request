import 'package:flutter/material.dart';
import 'package:login_firebase/views/category.dart';
import 'package:login_firebase/views/urunDetail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _icerikler = [];
  int _butonunDurumu = 0;
  UrunDetail? detail;

  @override
  void initState() {
    super.initState();

    // String productName = detail!.productName!;
    // String productCode = detail!.productCode!;
    UrunDetail? ud;
    _icerikler = [
      Category(),
      UrunDetail(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _butonunDurumu,
        fixedColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 16.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        iconSize: 26.0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_outlined),
            label: 'Varlıklar',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Sepetim'),
        ],
        onTap: (int aktifButonDurumu) {
          setState(() {
            _butonunDurumu = aktifButonDurumu;
          });
        },
      ),
      body: _icerikler[_butonunDurumu],
    );
  }
}
