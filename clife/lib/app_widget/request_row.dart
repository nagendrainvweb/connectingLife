import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RequestRow extends StatelessWidget {
  const RequestRow({
    Key key,
    this.onAcceptClicked,
  }) : super(key: key);

  final Function onAcceptClicked;

  _getListTitleValue(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "$value",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
       // shadowColor: AppColors.mainColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // border:
                      //     Border.all(color: AppColors.mainColor, width: 1),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.redAccent.withOpacity(0.3),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AppImages.blood_fill_drop,
                            height: 50,
                            width: 50,
                            color: AppColors.redAccent.withOpacity(0.9),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "A+",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        // vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Ram ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "(21 Yaers)",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade600,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _getListTitleValue("Type", "Blood"),
                                SizedBox(
                                  width: 5,
                                ),
                                _getListTitleValue("Date", "23-10-2021"),
                                SizedBox(
                                  width: 5,
                                ),
                                _getListTitleValue("Location", "Mulund"),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          InkWell(
                            onTap: onAcceptClicked,
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 16,
                                    color: AppColors.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Accept Request",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}