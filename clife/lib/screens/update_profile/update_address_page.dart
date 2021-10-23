import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class UpdateAddressPage extends StatefulWidget {
  const UpdateAddressPage({ Key key }) : super(key: key);

  @override
  _UpdateAddressPageState createState() => _UpdateAddressPageState();
}

class _UpdateAddressPageState extends State<UpdateAddressPage> {
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
          "Address",
          style: TextStyle(color: AppColors.textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          child: Column(
            children: [
              AppTextfield(
                icon: Icons.location_city_outlined,
                hint: "Address",
              ),
              SizedBox(height: 12,),
               AppTextfield(
                icon: Icons.location_city,
                hint: "Area",
              ),
              SizedBox(height: 12,),
               AppTextfield(
                icon: Icons.location_city,
                hint: "Pincode",
              ),
              SizedBox(height: 12,),
               AppTextfield(
                icon: Icons.location_city_outlined,
                hint: "City",
              ),
              SizedBox(height: 12,),
               AppTextfield(
                icon: Icons.location_city_outlined,
                hint: "State",
              ),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}