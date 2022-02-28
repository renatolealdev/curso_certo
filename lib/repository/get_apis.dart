import 'package:http/http.dart' as http;
import 'dart:convert';

Future getAPI() async {
  List<List> returnGetApi = [];

  final urlFiscais = Uri.parse('https://cefis.com.br/api/v1/event?c=fiscal');
  var responseFiscais = await http.get(urlFiscais);
  if (responseFiscais.statusCode == 200) {
    var jsonFiscais = jsonDecode(utf8.decode(responseFiscais.bodyBytes));
    returnGetApi.add(
        jsonFiscais['data'].where((el) => el['category'] == 'Fiscal').toList());
  } else {
    throw Exception('Erro ao carregar dados! <throwError>');
  }

  final urlContabil = Uri.parse('https://cefis.com.br/api/v1/event?c=contabil');
  var responseContabeis = await http.get(urlContabil);
  if (responseContabeis.statusCode == 200) {
    var jsonContabil = jsonDecode(utf8.decode(responseContabeis.bodyBytes));
    returnGetApi.add(
        jsonContabil['data'].where((el) => el['category'] == 'Contabil').toList());
  } else {
    throw Exception('Erro ao carregar dados! <throwError>');
  }

  return returnGetApi;
}
