import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultContabil {
  List titleContabil = [];
  List bannerContabil = [];

  Future<void> loadContabil() async {
    final response = await http.get(
      Uri.parse('https://cefis.com.br/api/v1/event?c=Contabil'),
    );
    final contabilApi = jsonDecode(response.body)['data'];
    //print("fiscalApi: ${fiscalApi}");

    var listContabil = Contabeis(contabilApi);
    // print(listFiscal.fiscais[0]);

    listContabil.contabeis.forEach((element) {
      var dataContabil = new DataContabil.fromJson(element);
      titleContabil.add(dataContabil.title);
      bannerContabil.add(dataContabil.banner);
    });

    print(titleContabil);
  }
}

class Contabeis {
  List contabeis = [];

  Contabeis(this.contabeis);
}

class DataContabil {
  String title;
  String banner;

  DataContabil(this.title, this.banner);

  factory DataContabil.fromJson(Map<String, dynamic> json) {
    return DataContabil(json['title'], json['banner']);
  }

  Map<String, dynamic> toJson() => {
        'title': this.title,
        'banner': this.banner,
      };
}
