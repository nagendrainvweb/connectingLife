import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({ Key key }) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
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
          "Profile",
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
                icon: Icons.person_outlined,
                hint: "First Name",
              ),
              SizedBox(height: 12,),
              AppTextfield(
                icon: Icons.person_outlined,
                hint: "Middle Name",
              ),
              SizedBox(height: 12,),
              AppTextfield(
                icon: Icons.person_outlined,
                hint: "Last Name",
              ),
              SizedBox(height: 12,),
              AppTextfield(
                icon: Icons.email_outlined,
                hint: "Email",
              ),
              SizedBox(height: 12,),
              AppTextfield(
                icon: Icons.phone_outlined,
                hint: "Mobile",
              ),
              SizedBox(height: 12,),
              AppTextfield(
                icon: Icons.calendar_today_outlined,
                hint: "Date of Birth",
              ),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}