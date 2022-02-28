import 'package:http/http.dart' as http;
import 'dart:convert';

Future getAPIDetails(int id) async {
  final int idCourse = id;
  List returnGetApiDetails = [];

  final urlDetails = Uri.parse('https://cefis.com.br/api/v1/event/${idCourse}');
  var responseDetails = await http.get(urlDetails);
  if (responseDetails.statusCode == 200) {
    var jsonDetails = jsonDecode(utf8.decode(responseDetails.bodyBytes));
    returnGetApiDetails.add(jsonDetails['data']);
  } else {
    throw Exception('Erro ao carregar dados! <throwError | getDetails | >');
  }

  return returnGetApiDetails;
}
