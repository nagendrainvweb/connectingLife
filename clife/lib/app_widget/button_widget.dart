// import 'package:diamon_assorter/util/app_color.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({Key key, this.buttonText, this.onPressed, this.color, this.border})
      : super(key: key);

  final String buttonText;
  final Function onPressed;
  final Color color;
  final Border border;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 120,
      padding: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.buttonColor),
        borderRadius: BorderRadius.circular(10)),
      color: color,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
