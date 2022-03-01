import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../repository/get_api_details.dart';
import '../screens/details.dart';
import 'card_banner.dart';
import 'card_marker.dart';
import 'card_text_title.dart';
import 'progressIndicator.dart';

class CarrousselFiscal extends StatefulWidget {
  final apiS;
  CarrousselFiscal({
    Key? key,
    required this.apiS,
  }) : super(key: key);

  @override
  State<CarrousselFiscal> createState() => _CarrousselFiscalState();
}

class _CarrousselFiscalState extends State<CarrousselFiscal> {
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
                'Fiscal',
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
                itemCount: widget.apiS[0].length,
                itemBuilder: (context, index) {
                  final bannerCardCurrent = widget.apiS[0][index]['banner'];
                  final titleCardCurrent = widget.apiS[0][index]['title'];
                  final subtitleCardCurrent = widget.apiS[0][index]['subtitle'];
                  final idCardCurrent = widget.apiS[0][index]['id'];
                  final currentAndLengthPage =
                      '${index + 1} / ${widget.apiS[0].length}';

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
                            future: getAPIDetails(idCardCurrent),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                      "Erro ao carregar dados! <snapshotError | pageDetails | >"),
                                );
                              }

                              if (snapshot.hasData) {
                                return Details(
                                  bannerCurrent: bannerCardCurrent,
                                  titleCurrent: titleCardCurrent,
                                  subtitleCurrent: subtitleCardCurrent,
                                  idCurrent: idCardCurrent,
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
                            child: BannerCard(
                                bannerCardCurrent: bannerCardCurrent),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        TitleCardCurrent(
                                            titleCardCurrent: titleCardCurrent),
                                        MarkerCard(
                                            currentAndLengthPage:
                                                currentAndLengthPage),
                                      ],
                                    ),
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
