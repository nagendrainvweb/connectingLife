import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class HomeWidgetHelp extends StatelessWidget {
  const HomeWidgetHelp(
      // ignore: non_constant_identifier_names
      {
    Key key,
    this.icons,
    this.border,
    this.color,
    this.count,
    this.title,
    this.iconColor,
    this.iconBackgroundColor,
  }) : super(key: key);

  final IconData icons;
  final String count;
  final Color color;
  final Border border;
  final String title;
  final Color iconColor;
  final Color iconBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBackgroundColor,
            ),
            child: Icon(
              icons,
              color: iconColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              count,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
