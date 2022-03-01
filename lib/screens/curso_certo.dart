import 'package:flutter/material.dart';
import '../components/card_carrousel_contabil.dart';
import '../components/card_carrousel_fiscal.dart';

class CursoCerto extends StatefulWidget {
// Esta Page, recebe como parâmetro em sua chamada, o resultado da função Future, que retorna uma List como o Decode dos dois EndPoints: <?c=fiscal> e <?c=contabil>
  final apiS;

  const CursoCerto({Key? key, required this.apiS}) : super(key: key);

  @override
  State<CursoCerto> createState() => _CursoCertoState();
}

class _CursoCertoState extends State<CursoCerto> {
  @override
  Widget build(BuildContext context) {
// Armazenando o appBar em uma 'final' para poder acessar seu height na hora de aplicar responsividade e adaptabilidade.
    final appBar = AppBar(
      backgroundColor: Color.fromRGBO(45, 46, 102, 1),
      title: Text(
        'Cursos',
        style: TextStyle(
          fontFamily: 'kanit',
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(255, 199, 44, 1),
        ),
      ),
      centerTitle: false,
    );

// 'final' que armazena o tamanho de tela disponível para o App - desconsiderando o 'StatusBar' e o 'AppBar'.
    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      backgroundColor: Color.fromRGBO(250, 226, 104, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // Aplico no height uma redução de 20px, correspondente ao SizedBox que introduzi no final da tela para melhorar a experência do usuário em dispositivos que contam como botão home sobre à tela (ex: iPhone 11).
            height: availableHeight - 20,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: CarrouselFiscal(apiS: widget.apiS), // PageView.Builder
                ),
                Expanded(
                  flex: 1,
                  child: CarrouselContabil(apiS: widget.apiS), // PageView.Builder
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
