import 'package:clife/app_widget/custom_app_bar.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(
        title: "Request",
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor,

            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mainColor,width: 1),
                        borderRadius: BorderRadius.circular(14),
                        
                      ),
                      child: SvgPicture.asset(
                        AppImages.blood_fill_drop,
                        height: 70,
                        width: 70,
                        color: AppColors.redAccent,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
