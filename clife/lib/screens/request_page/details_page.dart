import 'package:clife/app_widget/custom_app_bar.dart';
import 'package:clife/screens/request_page/request_list_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(
        title: "Details",
      ),
      body: Column(
        children: [
          RequestViewSheetWidget(
            isDetails: true,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Container(
                height: 80,
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:8,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            child: SvgPicture.asset(
                              AppImages.profile,
                              height: 120,
                              width: 120,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Text("Ram",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("Age/M",
                              style: TextStyle(
                                fontSize: 11,
                              ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 70,),
                        Icon(Icons.call_outlined,
                        size: 18,
                        color:AppColors.mainColor,
                        ),
                        SizedBox(width: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical:7,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text("5km",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
