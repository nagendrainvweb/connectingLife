import 'package:clife/app_widget/home_widget_helper.dart';
import 'package:clife/screens/request_page/request_list_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_image.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                "GIVE THE GIFT OF LIFE", // child: GestureDetector(
                //   onTap: onClick,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(12),
                //         border: Border.all(color: AppColors.grey500, width: 1)),
                //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                //     child: Row(
                //       children: [
                //         Icon(
                //           iconData,
                //           color: AppColors.grey600,
                //         ),
                //         SizedBox(
                //           width: 12,
                //         ),
                //         Expanded(
                //             child: Text(

                //           text,
                //           textScaleFactor: 1.1,
                //           style: TextStyle(
                //               color: AppColors.grey700, fontWeight: FontWeight.bold),
                //         )),
                //         Icon(
                //           Icons.chevron_right_outlined,
                //           color: AppColors.grey600,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
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
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Column(
              children: [
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: HomeWidgetHelp(
                        icon: Icon(
                          Icons.search_outlined,
                          color: AppColors.pinklight,
                        ),
                        title: "Find A Donor",
                        count: "23.5k",
                        iconColor: AppColors.pinklight,
                        iconBackgroundColor: AppColors.extraLightpinkColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: HomeWidgetHelp(
                        icon: Icon(Icons.notifications_outlined,
                            color: AppColors.yellowLight),
                        title: "Blood Request",
                        count: "500k",
                        iconColor: AppColors.yellowLight,
                        iconBackgroundColor: AppColors.extraLightYellowColor,
                        onClick: () {
                          Utility.pushToNext(context, RequestPage());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: HomeWidgetHelp(
                        icon: Icon(Icons.bloodtype_outlined,
                            color: AppColors.skyLight),
                        title: "Blood Bank",
                        count: "Map",
                        iconColor: AppColors.skyLight,
                        iconBackgroundColor: AppColors.extraSkyLight,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: HomeWidgetHelp(
                        icon: Icon(Icons.settings_outlined,
                            color: AppColors.blackLight),
                        title: "Other",
                        count: "More",
                        iconColor: AppColors.blackLight,
                        iconBackgroundColor: AppColors.extraBlueLight,
                      ),
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
