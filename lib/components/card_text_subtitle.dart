import 'package:flutter/material.dart';

class CardSubtitle extends StatelessWidget {
  final subtitleCardCurrent;
  const CardSubtitle({Key? key, required this.subtitleCardCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      alignment: Alignment.topCenter,
      child: Text(
        subtitleCardCurrent,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(162, 172, 171, 1),
          fontFamily: 'Kanit',
          fontSize: 15,
          fontWeight: FontWeight.w300,
          height: 1,
        ),
      ),
    );
  }
}
