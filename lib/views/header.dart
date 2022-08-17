import 'package:flutter/material.dart';
import 'package:login_firebase/bindings/datamodelgold.dart';
import 'package:login_firebase/views/urunDetail.dart';
import '../bindings/datamodel.dart';
import '../controllers/service.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  TabController? _controller;
  Service apiManager = Service();
  Future<DataModel>? _futureMany;
  Future<DataModelGold>? _futureGold;

  @override
  void initState() {
    super.initState();
    _futureMany = apiManager.fetchDataMany();
    _futureGold = apiManager.fetchDataGold();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: _controller,
          isScrollable: false,
          labelColor: Colors.red,
          indicatorColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontSize: 14.0),
          tabs: [
            Tab(
              child: Text('Para Birimleri'),
            ),
            Tab(
              child: Text('Altın ONS'),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              _futureUsersMany(context),
              _futureUsersGoldONS(context),
            ],
          ),
        ),
      ],
    );
  }

  _futureUsersMany(BuildContext context) {
    return FutureBuilder<DataModel>(
      future: _futureMany,
      builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.result != null
                ? snapshot.data!.result!.data!.length
                : 0,
            itemBuilder: (BuildContext context, int index) {
              final _name = snapshot.data!.result!.data![index].name;
              final _code = snapshot.data!.result!.data![index].code;
              final _ratee = snapshot.data!.result!.data![index].rate;
              final _rate = 1 / _ratee!;
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UrunDetail(
                              productName: _name,
                              productCode: _code,
                              productPrice: _rate,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            _name!,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          // title: Text(
                          //   'Blok-1',
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //   ),
                          // ),
                          subtitle: Text(
                            _code!,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          // subtitle: Text(
                          //   'Blok-2',
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //   ),
                          // ),
                          trailing: Text(
                            "${_rate.toStringAsFixed(7).toString()}" +
                                "  TL"
                                    "",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          // trailing: Text(
                          //   'Blok-3',
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _futureUsersGoldONS(BuildContext context) {
    return FutureBuilder<DataModelGold>(
        future: _futureGold,
        builder: (BuildContext context, AsyncSnapshot<DataModelGold> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.result != null
                    ? snapshot.data!.result!.length
                    : 0,
                itemBuilder: (BuildContext context, int index) {
                  final _name = snapshot.data!.result![index].name;
                  final _buy = snapshot.data!.result![index].buying;
                  final _sell = snapshot.data!.result![index].selling;

                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrunDetail(
                                  productName: _name,
                                  productCode: 'Satis',
                                  productPrice: _sell,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 3.0,
                                  spreadRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 7.0,
                                  right: 15.0,
                                  left: 10.0,
                                  bottom: 7.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _name.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // Text(
                                  //   'Blok-1',
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Alış: ${_buy!}  TL",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        // Text(
                                        //   'Blok-2',
                                        //   style: TextStyle(
                                        //     color: Colors.black,
                                        //   ),
                                        // ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Satış: ${_sell.toString()}" + "  TL",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        // Text(
                                        //   'Blok-3',
                                        //   style: TextStyle(
                                        //     color: Colors.black,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
