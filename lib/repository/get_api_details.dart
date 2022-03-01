import 'package:http/http.dart' as http;
import 'dart:convert';

// 1. - Função Future que acessa em consome a API de detalhes dos cursos.
// 1.1 - Criei ela para receber como parâmetro, o id do curso selecionado no Card.
// 1.2 - Esse id é interpolado com 'TemplateString' na URI da API, para acessar, no momento da chamada da função, apenas o curso de interesse naquela chamada.
// 2. - Caso o retorno da conexão com a API seja positivo, a função decodifica o JSON (utilizando o método utf8 para resolver questões de caractéres especiais das Strings) e o armazena em uma 'var' que será adicionada à uma List.
// 2.1 - Caso o retorno seja negativo para a conexão com a API, retorna uma Exceção informando dobre o erro.
// 3. - Caso tudo dê certo, retorna a List contendo a informação solicitada.
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
