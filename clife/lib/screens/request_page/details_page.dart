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
  _getListTitleValue({@required String title, @required String value}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
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
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
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
                                    Text(
                                      " Deshmukh",
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
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          _getListTitleValue(
                                              title: "Email ",
                                              value: ": xyz@gmail.com"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          _getListTitleValue(
                                              title: "Mobile ",
                                              value: ": 9568434822"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          _getListTitleValue(
                                              title: "Date of Birth ",
                                              value: ": 20-10-2000"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          _getListTitleValue(
                                              title: "Any Medical History ",
                                              value: ": Yes/No"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          _getListTitleValue(
                                              title:
                                                  "Are You Regular Blood Donor ",
                                              value: ": Yes/No"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          _getListTitleValue(
                                              title: "Are YOu a Smoker ",
                                              value: ": Yes/No"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          _getListTitleValue(
                                              title:
                                                  "Are You Drinking Alcohol ",
                                              value: ": Yes/No"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          _getListTitleValue(
                                              title: "Veg/NonVeg ",
                                              value: ": Veg/NonVeage"),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 6,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Call",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColors.whiteColor,
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
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "WhatsApp",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
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
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Ram",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Age/M",
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Icon(
                            Icons.call_outlined,
                            size: 18,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "5km",
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
            ),
          )
        ],
      ),
    );
  }
}
