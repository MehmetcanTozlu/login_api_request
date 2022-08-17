import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_firebase/bindings/datamodelgold.dart';
import '../bindings/apicontext.dart';
import '../bindings/datamodel.dart';

class Service {
  Future<DataModel> fetchDataMany() async {
    http.Response response = await http.get(
      Uri.parse(ApiContext.API_LINK_MANY),
      headers: {
        'Authorization': '${ApiContext.API_KEY}',
      },
    );
    if (response.statusCode == 200) {
      final _jsonResult = DataModel.fromJson(jsonDecode(response.body));
      return _jsonResult;
    } else
      throw Exception(
          'Para Birimleri baglanti Istegi basarisiz oldu...\n${response.statusCode}');
  }

  Future<DataModelGold> fetchDataGold() async {
    http.Response response =
        await http.get(Uri.parse(ApiContext.API_LINK_GOLD), headers: {
      'Authorization': "${ApiContext.API_KEY}",
    });
    if (response.statusCode == 200) {
      final _jsonResult = DataModelGold.fromJson(jsonDecode(response.body));
      return _jsonResult;
    } else
      throw Exception(
          'Altin ONS baglanti istegi basarisiz oldu...\n${response.statusCode}');
  }
}
