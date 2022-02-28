import 'package:flutter/material.dart';

class ProgressIndicatorPage extends StatelessWidget {
  const ProgressIndicatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(250, 226, 104, 1),
      child: Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(255, 199, 44, 1),
          backgroundColor: Color.fromRGBO(16, 25, 32, 1),
        ),
      ),
    );
  }
}
