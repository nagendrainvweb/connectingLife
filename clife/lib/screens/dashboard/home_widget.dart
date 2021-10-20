import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class HomeWidgetPage extends StatelessWidget {
  const HomeWidgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        RichText(
          text: TextSpan(
            text: 'Donate ',
            
            style: TextStyle(
              fontSize: 25,
              color: Colors.pinkAccent,
            ),
            children: const <TextSpan>[
              TextSpan(
                  text: 'Blood', style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.pinkAccent,),),
              // TextSpan(text: ' world!'),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 60,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ) ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12,),
                  color: Colors.pinkAccent,
                ),
                child: Column(
                  children: [
                    Text("157",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.whiteColor,
                    ),
                    ),
                    Text("New Blood\nRequired",
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
                padding:EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ) ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12,),
                  color: AppColors.greyColor,
                ),
                child: Column(
                  children: [
                    Text("15K",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.whiteColor,
                    ),
                    ),
                    Text("Save Lives",
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
      ],
    );
  }
}
