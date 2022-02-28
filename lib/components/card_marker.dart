import 'package:flutter/material.dart';

class MarkerCard extends StatelessWidget {
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
            fontFamily: 'Kanit',
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
