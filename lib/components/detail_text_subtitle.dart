import 'package:flutter/material.dart';

class SubtitleDetails extends StatelessWidget {
// 'final' que recebe, via parâmetro, o Subtítulo do card atual(selecionado).
  final subtitleCurrent;
  const SubtitleDetails({Key? key, required this.subtitleCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10, right: 20, left: 20),
      padding: EdgeInsets.only(
        top: 7,
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 0.5,
          color: Colors.blue,
        ),
      )),
      child: Text(
        '${subtitleCurrent}',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            height: 1,
            fontFamily: 'Kanit',
            fontSize: 18,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
