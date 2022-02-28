import 'package:flutter/material.dart';

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
                  bool activePage = index == _currentPage;
                  final double vertical = activePage ? 5.0 : 25.0;
                  final double blur = activePage ? 3 : 0;
                  final double offset = activePage ? 2 : 0;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 400),
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
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    widget.apiS[1][index]['banner']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${widget.apiS[1][index]['title']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Kanit',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10.0),
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "${widget.apiS[1][index]['subtitle']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                162, 172, 171, 1),
                                            fontFamily: 'Kanit',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 199, 44, 1),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Text(
                                      '${index + 1} / ${widget.apiS[1].length}',
                                      style: TextStyle(
                                        fontFamily: 'Kanit',
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
