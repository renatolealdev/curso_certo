import 'package:http/http.dart' as http;
import 'dart:convert';

Future getDetails() async {
  final url = Uri.parse('https://cefis.com.br/api/v1/event?c=fiscal');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    return json['data'];
  } else {
    throw Exception('Erro ao carregar dados! <throwError>');
  }
}
