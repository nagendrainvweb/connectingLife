// import 'package:diamon_assorter/util/app_color.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView(
      {Key key, this.buttonText, this.onPressed, this.color, this.border, this.textColor=Colors.white})
      : super(key: key);

  final String buttonText;
  final Function onPressed;
  final Color color;
  final Border border;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: 180,
      padding: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.mainDarkColor),
          borderRadius: BorderRadius.circular(10)),
      color: color,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
