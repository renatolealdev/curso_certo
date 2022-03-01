import 'package:flutter/material.dart';

class MarkerCard extends StatelessWidget {
// 'final' que recebe, via parâmetro, o Card atual(selecionado) e a quantidade total de Cards - para o usuário sempre saber se localizar nos Cards.
  final currentAndLengthPage;
  const MarkerCard({Key? key, required this.currentAndLengthPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 199, 44, 0.7),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          '${currentAndLengthPage}',
          style: TextStyle(
            color: Color.fromRGBO(16, 25, 32, 1),
            fontFamily: 'Kanit',
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
