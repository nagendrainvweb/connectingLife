import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class BloodGroupPage extends StatefulWidget {
  const BloodGroupPage({Key key}) : super(key: key);

  @override
  _BloodGroupPageState createState() => _BloodGroupPageState();
}

class _BloodGroupPageState extends State<BloodGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: AppColors.textColor,
        ),
        title: Text(
          "Select Blood Group",
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 8,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount
                  (crossAxisCount: 4,
                  //  crossAxisSpacing: 3,
                  mainAxisSpacing: 10,
                  ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                    // vertical: 10,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    // margin: EdgeInsets.symmetric(
                    //   horizontal: 5,
                    //   vertical: 5,
                    // ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.mainColor,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.bloodtype_outlined,
                          color: AppColors.grey700,
                          size: 35,
                        ),
                        Text(
                          "A positive\n(A+)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20,),
          ButtonView(
            buttonText: "Submit",
            color: AppColors.buttonColor,
            onPressed: (){},
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
