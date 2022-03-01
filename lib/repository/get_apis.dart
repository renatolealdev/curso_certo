import 'package:http/http.dart' as http;
import 'dart:convert';

// 1. - Nesta função Future, eu trato duas requisições ao mesmo tempo e armazeno o consumo das API's distintas em uma List com dois elementos - EndPoint fiscal e contábil.
// 1.1 - Após realizar a decodificação dos JSON's, utilizando o método utf8, realizo um filtro (utilizando o where() - filter em outras linguagens), que adicionará na Listt returnGetApi apenas os cursos cuja a chave: 'category' contenha o valor: Fiscal para o caso da verificação de cursos fiscais, e valor: Contabil para o caso da verificação de cursos contábeis.
// 2. - Caso houver algum erro nesse processo, será exibido uma Exceção com a indicação do erro.
// 3. - Após todas as verificações, a função Future getAPI() retornará uma List com dois elementos indexados, sendo o elemento [0] correspondente aos cursos especificamente Fiscais e o elemento [1], para os cursos especificamente Contábeis.
Future getAPI() async {
  List<List> returnGetApi = [];

  final urlFiscais = Uri.parse('https://cefis.com.br/api/v1/event?c=fiscal');
  var responseFiscais = await http.get(urlFiscais);
  if (responseFiscais.statusCode == 200) {
    var jsonFiscais = jsonDecode(utf8.decode(responseFiscais.bodyBytes));
    returnGetApi.add(
        jsonFiscais['data'].where((el) => el['category'] == 'Fiscal').toList());
  } else {
    throw Exception('Erro ao carregar dados! <throwError | getFiscais | >');
  }

  final urlContabil = Uri.parse('https://cefis.com.br/api/v1/event?c=contabil');
  var responseContabeis = await http.get(urlContabil);
  if (responseContabeis.statusCode == 200) {
    var jsonContabil = jsonDecode(utf8.decode(responseContabeis.bodyBytes));
    returnGetApi.add(
        jsonContabil['data'].where((el) => el['category'] == 'Contabil').toList());
  } else {
    throw Exception('Erro ao carregar dados! <throwError | getContábil | >');
  }

  return returnGetApi;
}
