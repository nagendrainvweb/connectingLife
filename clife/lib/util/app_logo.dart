import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30,),
          child: Image(
            image: AssetImage("assets/intro.jpg"),
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
