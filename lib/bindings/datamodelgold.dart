class DataModelGold {
  List<Result>? result;
  bool? success;

  DataModelGold({this.result, this.success});

  DataModelGold.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Result {
  String? name;
  double? buying;
  String? buyingstr;
  double? selling;
  String? sellingstr;
  String? time;
  String? date;
  String? datetime;
  double? rate;

  Result(
      {this.name,
      this.buying,
      this.buyingstr,
      this.selling,
      this.sellingstr,
      this.time,
      this.date,
      this.datetime,
      this.rate});

  Result.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    buying = json['buying'];
    buyingstr = json['buyingstr'];
    selling = json['selling'];
    sellingstr = json['sellingstr'];
    time = json['time'];
    date = json['date'];
    datetime = json['datetime'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['buying'] = this.buying;
    data['buyingstr'] = this.buyingstr;
    data['selling'] = this.selling;
    data['sellingstr'] = this.sellingstr;
    data['time'] = this.time;
    data['date'] = this.date;
    data['datetime'] = this.datetime;
    data['rate'] = this.rate;
    return data;
  }
}
