import 'package:flutter/material.dart';

class CarrousselContabil extends StatelessWidget {
  const CarrousselContabil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Contábil',
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 50,
                    ),
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
                    child: Center(
                      child: Text("Teste"),
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
