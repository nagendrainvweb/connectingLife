import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/app_widget/custom_app_bar.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_image.dart';
import 'package:clife/util/dialog_helper.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  String title;
  String content;
  VoidCallback continueCallBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(
        title: "Request",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            // border:
                            //     Border.all(color: AppColors.mainColor, width: 1),
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.redAccent.withOpacity(0.6),
                          ),
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                AppImages.blood_fill_drop,
                                height: 35,
                                width: 35,
                                color: AppColors.redAccent,
                              ),
                              Container(
                                height: 35,
                                width: 35,
                                child: Center(
                                  child: Text(
                                    "A+",
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            // vertical: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ram",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Type",
                                          style: TextStyle(
                                            fontSize: 9,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Blood",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                            fontSize: 9,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "23/10/2021",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                            fontSize: 9,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Malad ",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  DialogHelper.showRemoveDialog(
                                      context,
                                      "Confirm",
                                      "Are you sure you want to accept request?",
                                      "Yes", () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                // margin: const EdgeInsets.symmetric(
                                                //     horizontal: 10, vertical: 5),
                                                // padding: const EdgeInsets.symmetric(
                                                //     horizontal: 20, vertical: 12),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                        // border:
                                                        //     Border.all(color: AppColors.mainColor, width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: AppColors
                                                            .redAccent
                                                            .withOpacity(0.6),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          SvgPicture.asset(
                                                            AppImages
                                                                .blood_fill_drop,
                                                            height: 35,
                                                            width: 35,
                                                            color: AppColors
                                                                .redAccent,
                                                          ),
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: Center(
                                                              child: Text(
                                                                "A+",
                                                                style:
                                                                    TextStyle(
                                                                  color: AppColors
                                                                      .mainColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Ram",
                                                    // textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                               Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Age",
                                                    // textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        });
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
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
                                          fontSize: 10,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
