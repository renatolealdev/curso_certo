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
      backgroundColor: Color.fromRGBO(250, 226, 104, 1),
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
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      color: Colors.black12,
                      child: Text(
                        '${titleCurrent}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Kanit',
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                      color: Colors.black26,
                      child: Text(
                        '${subtitleCurrent}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Kanit',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      color: Colors.deepPurple,
                      child: Text(
                        '${othersDetails.where((el) => el['id'] == idCurrent).toList()[0]['resume']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.1,
                            fontFamily: 'Kanit',
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      color: Colors.amber,
                      child: Text(
                        '${othersDetails.where((el) => el['id'] == idCurrent).toList()[0]['goal']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
