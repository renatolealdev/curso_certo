import 'package:curso_certo/components/carroussel_contabil.dart';
import 'package:curso_certo/components/carroussel_fiscal.dart';
import 'package:flutter/material.dart';

class CursoCerto extends StatefulWidget {
  final apiS;

  const CursoCerto({Key? key, required this.apiS}) : super(key: key);

  @override
  State<CursoCerto> createState() => _CursoCertoState();
}

class _CursoCertoState extends State<CursoCerto> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Color.fromRGBO(45, 46, 102, 1),
      title: Text(
        'Cursos',
        style: TextStyle(
          fontFamily: 'kanit',
          fontSize: 30,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: availableHeight - 50,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: CarrousselFiscal(apiS: widget.apiS),
                ),
                Expanded(
                  flex: 1,
                  child: CarrousselContabil(apiS: widget.apiS),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
