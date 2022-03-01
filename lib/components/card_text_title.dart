import 'package:flutter/material.dart';

class TitleCardCurrent extends StatelessWidget {
// 'final' que recebe, via parâmetro, o Título do card atual(selecionado).
  final titleCardCurrent;
  const TitleCardCurrent({Key? key, required this.titleCardCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      alignment: Alignment.topCenter,
      child: Text(
        titleCardCurrent,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Kanit',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1,
        ),
      ),
    );
  }
}
