import 'package:flutter/material.dart';

class GoalDetails extends StatelessWidget {
// 'final' que recebe, via parâmetro, o Objetivo do curso atual(selecionado).
  final goalCurrent;
  const GoalDetails({Key? key, required this.goalCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 3,
        right: 15,
        left: 15,
      ),
      child: Text(
        goalCurrent,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(162, 172, 171, 1),
            height: 1.1,
            fontFamily: 'Kanit',
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
