import 'package:flutter/material.dart';
import '../components/detail_text_goal.dart';
import '../components/detail_text_resume.dart';
import '../components/detail_text_subtitle.dart';
import '../components/detail_text_title.dart';

class Details extends StatelessWidget {
// Todas as informações de interesse dessa page, são enviadas via parâmetro na chamada do Widget, conforme estrutura logo abaixo.
  final bannerCurrent; // String
  final titleCurrent; // String
  final subtitleCurrent; // String
  final idCurrent; // int
  final othersDetails; // List<dynamic>

  const Details({
    Key? key,
    this.bannerCurrent,
    this.titleCurrent,
    this.subtitleCurrent,
    this.idCurrent,
    this.othersDetails,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
// Sempre que a Page Details() é chamada, essa 'final' recebe o retorno do 'Filter()' que disponibiliza apenas a descrição do curso selecionado no card.
    final resumeCurrentCourse = othersDetails
        .where((el) => el['id'] == idCurrent)
        .toList()[0]['resume'];
// Sempre que a Page Details() é chamada, essa 'final' recebe o retorno do 'Filter()' que disponibiliza apenas o objetivo do curso selecionado no card.
    final goalCurrentCourse =
        othersDetails.where((el) => el['id'] == idCurrent).toList()[0]['goal'];

// Armazenando o appBar em uma 'final' para poder acessar seu height na hora de aplicar responsividade e adaptabilidade.
    final appBar = AppBar(
      backgroundColor: Color.fromRGBO(45, 46, 102, 1),
      title: Text(
        'Detalhes',
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
      backgroundColor: Color.fromRGBO(16, 25, 32, 1),
      body: Column(
        children: [
          Container(
            // Banner é exibido em 30% do tamanho de tela disponível
            width: double.infinity,
            height: availableHeight * 0.3,
            child: Image.network('${bannerCurrent}', fit: BoxFit.cover),
          ),
          Container(
            // Informações do curso é exibida nos outros 70% restantes
            width: double.infinity,
            height: availableHeight * 0.7,
            child: SingleChildScrollView(
              // Tamanho dos textos é dinâmico - eis a solução!
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TitleDetails(titleCurrent: titleCurrent), // Componente
                    SubtitleDetails(
                        subtitleCurrent: subtitleCurrent), // Componente
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        'Descrição do curso:',
                        style: TextStyle(
                          color: Color.fromRGBO(250, 226, 104, 1),
                          fontFamily: 'Kanit',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ResumeDetails(
                      // Componente
                      resumeCurrent: resumeCurrentCourse,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        'Objetivo(s) deste curso:',
                        style: TextStyle(
                          color: Color.fromRGBO(250, 226, 104, 1),
                          fontFamily: 'Kanit',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GoalDetails(goalCurrent: goalCurrentCourse), // Componente
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
