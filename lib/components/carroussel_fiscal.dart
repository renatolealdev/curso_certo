import 'package:flutter/material.dart';

class CarrousselFiscal extends StatelessWidget {
  final apiFiscal;
  const CarrousselFiscal({
    Key? key,
    required this.apiFiscal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Área Fiscal',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              alignment: Alignment.topCenter,
              child: PageView.builder(
                itemCount: apiFiscal.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: Offset(4, 4),
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(apiFiscal[index]['banner']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 5.0),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${apiFiscal[index]['title']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Kanit',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 5.0),
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${apiFiscal[index]['subtitle']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Kanit',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
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