import 'package:flutter/material.dart';

class TitleDetails extends StatelessWidget {
// 'final' que recebe, via parâmetro, o Título do card atual(selecionado).
  final titleCurrent;
  const TitleDetails({Key? key, required this.titleCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
      ),
      child: Text(
        '${titleCurrent}',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(255, 199, 44, 1),
            height: 1,
            fontFamily: 'Kanit',
            fontSize: 22,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
