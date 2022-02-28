import 'package:flutter/material.dart';

class TitleCardCurrent extends StatelessWidget {
  final titleCardCurrent;
  const TitleCardCurrent({Key? key, required this.titleCardCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
