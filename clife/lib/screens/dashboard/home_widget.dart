import 'package:clife/app_widget/home_widget_helper.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class HomeWidgetPage extends StatelessWidget {
  const HomeWidgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gradientColor,
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "GIVE THE GIFT OF LIFE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Donate ',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.pinkAccent,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Blood',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    // TextSpan(text: ' world!'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: Colors.pinkAccent,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "157",
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        "New Blood\nRequired",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: AppColors.greyColor,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "15K",
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        "Save Lives",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Each Donation can help save up to 3 lives!",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeWidgetHelp(
                      icons: Icons.search_outlined,
                      title: "Find A Doctor",
                      count: "23.5k",
                      iconColor: AppColors.pinklight,
                      iconBackgroundColor: AppColors.extraLightpinkColor,
                    ),
                    HomeWidgetHelp(
                      icons: Icons.notifications_outlined,
                      title: "Blood Request",
                      count: "500k",
                      iconColor: AppColors.yellowLight,
                      iconBackgroundColor: AppColors.extraLightYellowColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeWidgetHelp(
                      icons: Icons.bloodtype,
                      title: "Blood Bank",
                      count: "Map",
                      iconColor: AppColors.skyLight,
                      iconBackgroundColor: AppColors.extraSkyLight,
                    ),
                    HomeWidgetHelp(
                      icons: Icons.settings_outlined,
                      title: "Other",
                      count: "More",
                      iconColor: AppColors.blackLight,
                      iconBackgroundColor: AppColors.extraBlueLight,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
