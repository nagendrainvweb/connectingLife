import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/app_widget/custom_app_bar.dart';
import 'package:clife/app_widget/request_row.dart';
import 'package:clife/screens/request_page/details_page.dart';
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

  _showConfirmDialog(BuildContext context) {
    DialogHelper.showRemoveDialog(
        context, "Confirm", "Are you sure you want to accept request?", "Yes",
        () {
      Navigator.pop(context);
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return RequestViewSheetWidget();
          });
    });
  }

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
              itemBuilder: (_, index) => RequestRow(
                onAcceptClicked: () {
                  _showConfirmDialog(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RequestViewSheetWidget extends StatelessWidget {
  const RequestViewSheetWidget({
    Key key,  this.isDetails=false,
  }) : super(key: key);
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      AppImages.blood_fill_drop,
                      height: 65,
                      width: 65,
                      color: AppColors.redAccent,
                    ),
                    Container(
                      height: 65,
                      width: 65,
                      child: Center(
                        child: Text(
                          "A+",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
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
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ram",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.grey700,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Age/M",
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.grey600,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Type",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.grey500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ":  Blood",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Liter",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.grey500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ":  2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Hospital",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.grey500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ":  Shiva Ji",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Address",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.grey500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ":  Malad AppPada (e)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text(
                    "Message",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.grey500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ":  Thank You",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Contact Person Name",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.grey500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ":  Ram",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            (isDetails)?Container():      
              Container(
                //color: AppColors.redAccent,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          //  horizontal: 18,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Call",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          //    horizontal: 18,
                          vertical: 6,
                        ),
                        // margin: EdgeInsets.symmetric(horizontal:10,),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "WhatsApp",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          //  horizontal: 18,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Share",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
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
      ],
    );
  }
}
