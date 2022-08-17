import 'package:flutter/material.dart';
import 'package:login_firebase/controllers/service.dart';
import 'package:login_firebase/views/header.dart';

class Category extends StatefulWidget {
  BuildContext? context;
  Category({Key? key, this.context}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Service apiManager = Service();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Header(),
      ),
    );
  }
}
