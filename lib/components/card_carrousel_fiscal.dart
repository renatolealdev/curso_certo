import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../repository/get_api_details.dart';
import '../screens/details.dart';
import 'card_banner.dart';
import 'card_marker.dart';
import 'card_text_title.dart';
import 'progressIndicator.dart';

class CarrouselFiscal extends StatefulWidget {
// Esta Page, recebe como parâmetro em sua chamada, o resultado da função Future, que a Page CursoCerto() recebeu. Retorna uma List como o Decode dos dois EndPoints: <?c=fiscal> e <?c=contabil>
  final apiS;
  CarrouselFiscal({
    Key? key,
    required this.apiS,
  }) : super(key: key);

  @override
  State<CarrouselFiscal> createState() => _CarrouselFiscalState();
}

class _CarrouselFiscalState extends State<CarrouselFiscal> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0; // var que armazena o valor da página atual

  @override
  void initState() {
    _pageController.addListener(() { // 'Escuta' em qual valor double o PageView está no momento. 
      int? next = _pageController.page!.round(); // Converte esse valor double em int.
      if (_currentPage != next) { // Estabelece a lógica para determinar se um Card está ativo ou não na tela.
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Fiscal',
                style: TextStyle(
                    height: 1,
                    color: Color.fromRGBO(16, 25, 32, 1),
                    fontFamily: 'Kanit',
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.topCenter,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.apiS[0].length,
                itemBuilder: (context, index) {
                  
// Aqui, eu armazeno individualemnte os valores obtidos através da requisição API, de acordo com a informação que desejo. *Obs: 1º - o índice [0] representa qual lista eu estou acessando: [0] para a fiscal e [1] para a contabil. 2º - o [index] representa a page atual perante o PageView.builder (necessário para saber de qual curso o contexto se trata. 3º - os índices acessados por [' '] indição a chave correspondente ao valor que eu quero acessar.)
                  final bannerCardCurrent = widget.apiS[0][index]['banner'];
                  final titleCardCurrent = widget.apiS[0][index]['title'];
                  final subtitleCardCurrent = widget.apiS[0][index]['subtitle'];
                  final idCardCurrent = widget.apiS[0][index]['id'];
                  final currentAndLengthPage =
                      '${index + 1} / ${widget.apiS[0].length}';

// Essas vars correspondem a lógica de decoração do Card atual, onde somente o atual(_currentPage) irá apresentar BoxShadow. A final vertical representa a animação de aumentar o Container que estiver atualmente sendo exibido.
                  bool activePage = index == _currentPage;
                  final double vertical = activePage ? 5.0 : 25.0;
                  final double blur = activePage ? 3 : 0;
                  final double offset = activePage ? 2 : 0;

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeOutQuint,
                    margin: EdgeInsets.symmetric(
                        vertical: vertical, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(16, 25, 32, 1),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(16, 25, 32, 0.700),
                          blurRadius: blur,
                          offset: Offset(offset, offset),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
// InkWell serve para rastrear o toque ou clique no Card atual (semelhante ao GestureDetector()). Quando tocado executa o método Navigator, que chama uma PageTransition que por sua vez aplica um efeito de fade ao exibir a nova tela. Inclui nessa chamada de função, outra FutureBuilder, pois eu preciso acessar uma terceira API e ela depende de informação das duas anteriores para retornar corretamente o que o App precisa. Enquanto essa requisição é feita, o App apresenta um CircularProgressIndicator personalizado e caso a requisição falhe, uma tela de erro é exibida.
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.fade,
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 500),
                          child: FutureBuilder(
                            future: getAPIDetails(idCardCurrent),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                      "Erro ao carregar dados! <snapshotError | pageDetails | >"),
                                );
                              }

                              if (snapshot.hasData) {
// Se tudo ocorrer bem na requisição, é chamada uma Instância da Page Details e informado todos os parâmetros necessários, com base no Card selecionado pelo usuário.
                                return Details(
                                  bannerCurrent: bannerCardCurrent,
                                  titleCurrent: titleCardCurrent,
                                  subtitleCurrent: subtitleCardCurrent,
                                  idCurrent: idCardCurrent,
                                  othersDetails: snapshot.data,
                                );
                              }
                              return ProgressIndicatorPage(); // Indicador de progresso
                            },
                          ),
                        ));
                      },
                      splashColor: Color.fromRGBO(255, 199, 44, 0.7),
                      borderRadius: BorderRadius.circular(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: BannerCard( // Chamada da instância do Banner que é exibido em cada Card
                                bannerCardCurrent: bannerCardCurrent),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        TitleCardCurrent( // Chamada da instância do Título que é exibido em cada Card
                                            titleCardCurrent: titleCardCurrent),
                                        MarkerCard( // Chamada da instância do marcador de página(Card) que é exibido em cada Card
                                            currentAndLengthPage:
                                                currentAndLengthPage),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
