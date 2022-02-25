import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color.fromRGBO(45, 46, 102, 1),
                  height: 60,
                  width: double.infinity,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Color.fromRGBO(162, 172, 171, 1),
                    width: double.infinity,
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
