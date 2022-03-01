import 'package:flutter/material.dart';

class ResumeDetails extends StatelessWidget {
// 'final' que recebe, via parâmetro, a Descrição do curso atual(selecionado).
  final resumeCurrent;
  const ResumeDetails({Key? key, required this.resumeCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: 3,
        right: 15,
        left: 15,
      ),
      child: Text(
        resumeCurrent,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(162, 172, 171, 1),
            height: 1.1,
            fontFamily: 'Kanit',
            fontSize: 18,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
