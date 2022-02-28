import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final bannerCurrent;
  final titleCurrent;
  final subtitleCurrent;
  final resumeCurrent;
  final goalCurrent;

  const Details({
    Key? key,
    required this.bannerCurrent,
    this.titleCurrent,
    this.subtitleCurrent,
    this.resumeCurrent,
    this.goalCurrent,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
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

    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      backgroundColor: Color.fromRGBO(250, 226, 104, 1),
      body: Container(
        child: Image.network(bannerCurrent),
      ),
    );
  }
}
