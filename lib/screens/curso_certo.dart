import 'package:curso_certo/components/carroussel_contabil.dart';
import 'package:curso_certo/components/carroussel_fiscal.dart';
import 'package:flutter/material.dart';

class CursoCerto extends StatefulWidget {
  final apiFiscal;

  const CursoCerto({Key? key, required this.apiFiscal}) : super(key: key);

  @override
  State<CursoCerto> createState() => _CursoCertoState();
}

class _CursoCertoState extends State<CursoCerto> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                        offset: Offset(2, 2),
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Cursos",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(16, 25, 32, 1),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: double.infinity,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:
                                  CarrousselFiscal(apiFiscal: widget.apiFiscal),
                            ),
                            Expanded(
                              flex: 1,
                              child: CarrousselContabil(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
