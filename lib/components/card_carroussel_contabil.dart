import 'package:curso_certo/components/card_banner.dart';
import 'package:curso_certo/components/card_marker.dart';
import 'package:curso_certo/components/card_text_subtitle.dart';
import 'package:curso_certo/components/card_text_title.dart';
import 'package:curso_certo/components/progressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../repository/get_api_details.dart';
import '../screens/details.dart';

class CarrousselContabil extends StatefulWidget {
  final apiS;
  CarrousselContabil({
    Key? key,
    required this.apiS,
  }) : super(key: key);

  @override
  State<CarrousselContabil> createState() => _CarrousselContabilState();
}

class _CarrousselContabilState extends State<CarrousselContabil> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      int? next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Contábil',
                style: TextStyle(
                    height: 1,
                    color: Color.fromRGBO(16, 25, 32, 1),
                    fontFamily: 'Kanit',
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.topCenter,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.apiS[1].length,
                itemBuilder: (context, index) {
                  final subtitleCardCurrent = widget.apiS[1][index]['subtitle'];
                  final titleCardCurrent = widget.apiS[1][index]['title'];
                  final currentAndLengthPage =
                      '${index + 1} / ${widget.apiS[1].length}';
                  final bannerCardCurrent = widget.apiS[1][index]['banner'];

                  bool activePage = index == _currentPage;
                  final double vertical = activePage ? 5.0 : 25.0;
                  final double blur = activePage ? 3 : 0;
                  final double offset = activePage ? 2 : 0;

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeOutQuint,
                    margin: EdgeInsets.symmetric(
                        vertical: vertical, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(16, 25, 32, 1),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(16, 25, 32, 0.700),
                          blurRadius: blur,
                          offset: Offset(offset, offset),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.fade,
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 500),
                          child: FutureBuilder(
                            future: getAPIDetails(widget.apiS[1][index]['id']),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                      "Erro ao carregar dados! <snapshotError | pageDetails | >"),
                                );
                              }

                              if (snapshot.hasData) {
                                return Details(
                                  bannerCurrent: widget.apiS[1][index]
                                      ['banner'],
                                  titleCurrent: widget.apiS[1][index]['title'],
                                  subtitleCurrent: widget.apiS[1][index]
                                      ['subtitle'],
                                  idCurrent: widget.apiS[1][index]['id'],
                                  othersDetails: snapshot.data,
                                );
                              }
                              return ProgressIndicatorPage();
                            },
                          ),
                        ));
                      },
                      splashColor: Color.fromRGBO(255, 199, 44, 0.7),
                      borderRadius: BorderRadius.circular(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                BannerCard(
                                    bannerCardCurrent: bannerCardCurrent),
                                MarkerCard(
                                    currentAndLengthPage: currentAndLengthPage),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: TitleCardCurrent(
                                        titleCardCurrent: titleCardCurrent),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: CardSubtitle(
                                        subtitleCardCurrent:
                                            subtitleCardCurrent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}