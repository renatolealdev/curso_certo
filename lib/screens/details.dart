import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final bannerCurrent; // String
  final titleCurrent; // String
  final subtitleCurrent; // String
  final idCurrent; // int
  final othersDetails; // List<dynamic>

  const Details({
    Key? key,
    this.bannerCurrent,
    this.titleCurrent,
    this.subtitleCurrent,
    this.idCurrent,
    this.othersDetails,
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
      backgroundColor: Color.fromRGBO(16, 25, 32, 1),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: availableHeight * 0.3,
            child: Image.network('${bannerCurrent}', fit: BoxFit.cover),
          ),
          Container(
            width: double.infinity,
            height: availableHeight * 0.7,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
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
                    ),
                    Container(
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        'Descrição do curso:',
                        style: TextStyle(
                          color: Color.fromRGBO(250, 226, 104, 1),
                          fontFamily: 'Kanit',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        top: 3,
                        right: 15,
                        left: 15,
                      ),
                      child: Text(
                        '${othersDetails.where((el) => el['id'] == idCurrent).toList()[0]['resume']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(162, 172, 171, 1),
                            height: 1.1,
                            fontFamily: 'Kanit',
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        'Objetivo(s) deste curso:',
                        style: TextStyle(
                          color: Color.fromRGBO(250, 226, 104, 1),
                          fontFamily: 'Kanit',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 3,
                        right: 15,
                        left: 15,
                      ),
                      child: Text(
                        '${othersDetails.where((el) => el['id'] == idCurrent).toList()[0]['goal']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(162, 172, 171, 1),
                            height: 1.1,
                            fontFamily: 'Kanit',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
