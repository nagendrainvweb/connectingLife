import 'package:flutter/material.dart';

class HomeWidgetPage extends StatelessWidget {
  const HomeWidgetPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GIVE THE GIFT OF LIFE",
            ),
          ],
        ),
        // SizedBox(height: 10,),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Donate',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 26,
            ),
            children: [
              TextSpan(
                text: 'Blood',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  // decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}