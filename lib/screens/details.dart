import 'package:curso_certo/components/detail_text_goal.dart';
import 'package:curso_certo/components/detail_text_resume.dart';
import 'package:curso_certo/components/detail_text_subtitle.dart';
import 'package:curso_certo/components/detail_text_title.dart';
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
    final resumeCurrentCourse = othersDetails
        .where((el) => el['id'] == idCurrent)
        .toList()[0]['resume'];
    final goalCurrentCourse =
        othersDetails.where((el) => el['id'] == idCurrent).toList()[0]['goal'];
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
                    TitleDetails(titleCurrent: titleCurrent),
                    SubtitleDetails(subtitleCurrent: subtitleCurrent),
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
                    ResumeDetails(
                      resumeCurrent: resumeCurrentCourse,
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
                    GoalDetails(goalCurrent: goalCurrentCourse),
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
