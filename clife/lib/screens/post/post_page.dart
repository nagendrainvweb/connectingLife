import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/screens/post/post_view_model.dart';
import 'package:clife/screens/register_page/register_page.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/common_pattern.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      viewModelBuilder: () => PostViewModel(),
      builder: (_, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: AppColors.textColor,
          ),
          title: Text(
            "Post",
            style: TextStyle(color: AppColors.textColor),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              children: [
                AppDropdownWidget(
                  title: "Donation Type",
                  icon: Icons.security_outlined,
                  item: ["Blood", "Platelete", "Plasma"],
                  chooseValue: model.donationTypeValue,
                  onChanged: (String value) {
                    model.donationTypeValue = value;
                    model.notifyListeners();
                  },
                  errorText: model.isDonationTypeError
                      ? "Please Select Donation Type"
                      : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.nameController,
                  icon: Icons.person_outlined,
                  hint: "Patient Name",
                  keyboardType: TextInputType.name,
                  obsecure: false,
                  errorText:
                      model.isNameError ? "Please Enter Patient Name" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.ageController,
                  icon: Icons.person_outlined,
                  hint: "Age",
                  keyboardType: TextInputType.number,
                  obsecure: false,
                  errorText: model.isAgeEror ? "Please Enter Age" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppDropdownWidget(
                  icon: Icons.person_outline,
                  title: "Gender",
                  item: ['Male', 'Female'],
                  chooseValue: model.genderValue,
                  onChanged: (String val) {
                    model.genderValue = val;
                    model.notifyListeners();
                  },
                  errorText:
                      model.isGenderError ? "Please Select Gender" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppDropdownWidget(
                  title: "Blood Group",
                  icon: Icons.bloodtype_outlined,
                  item: [
                    'A+',
                    'O+',
                    'B+',
                    'AB+',
                    'A-',
                    'O-',
                    'B-',
                    'AB-',
                  ],
                  chooseValue: model.dropDownValue,
                  onChanged: (String val) {
                    model.dropDownValue = val;
                    model.notifyListeners();
                  },
                  errorText: model.isBloodGroupError
                      ? "Please Enter Blood Group"
                      : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.unitController,
                  icon: Icons.monitor_weight_outlined,
                  hint: "No of Unit",
                  keyboardType: TextInputType.number,
                  obsecure: false,
                  errorText:
                      model.isUnitError ? "Please Enter No of Unit" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.hospitalNameController,
                  icon: Icons.local_hospital_rounded,
                  hint: "Hospital Name",
                  keyboardType: TextInputType.name,
                  obsecure: false,
                  errorText: model.isHospitalNameEror
                      ? "Please Select Hospital Name"
                      : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.addressController,
                  icon: Icons.location_city_outlined,
                  hint: "Address",
                  keyboardType: TextInputType.name,
                  obsecure: false,
                  errorText:
                      model.isAddressError ? "Please Enter Address" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.areaController,
                  icon: Icons.location_city_outlined,
                  hint: "Area",
                  keyboardType: TextInputType.name,
                  obsecure: false,
                  errorText: model.isAreaError ? "Please Enter Area" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.pincodeController,
                  icon: Icons.location_city_outlined,
                  hint: "Pincode",
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    model.isPincodeError =
                        !RegExp(CommonPattern.pincodeRegex).hasMatch(value);
                    if (!model.isPincodeError) {
                      model.fetchPinCode(value, context);
                    }
                    model.notifyListeners();
                  },
                  obsecure: false,
                  errorText:
                      model.isPincodeError ? "Please Enter Pincode" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.stateController,
                  icon: Icons.location_city_outlined,
                  hint: "State",
                  enable: false,
                  keyboardType: TextInputType.name,
                  obsecure: false,
                  // errorText: model.isStateError ? "Please Enter State" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.cityController,
                  icon: Icons.location_city_outlined,
                  hint: "City",
                  keyboardType: TextInputType.name,
                  obsecure: false,
                  enable: false,
                  //  errorText: model.isCityError ? "Please Enter City" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.contactPersonController,
                  icon: Icons.person_outlined,
                  hint: "Contact Person Name",
                  keyboardType: TextInputType.name,
                  obsecure: false,
                  errorText: model.isContactPersonName
                      ? "Please Enter Contact Person Name"
                      : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.contactPersonMobileController,
                  icon: Icons.contact_phone_outlined,
                  hint: "Contact Person Mobile",
                  keyboardType: TextInputType.name,
                  onChanged: (String value) {
                    model.isContactPersonMobile =
                        !RegExp(CommonPattern.mobile_regex).hasMatch(value);
                    model.notifyListeners();
                  },
                  obsecure: false,
                  errorText: model.isContactPersonMobile
                      ? "Please Enter Contact Person mobile"
                      : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextfield(
                  controller: model.messageController,
                  icon: Icons.message_outlined,
                  hint: "Message",
                  keyboardType: TextInputType.name,
                  obsecure: false,
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonView(
                  buttonText: "Submit",
                  color: AppColors.mainColor,
                  textColor: AppColors.whiteColor,
                  onPressed: () {
                    model.validateForm(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppDropdownWidget extends StatelessWidget {
  const AppDropdownWidget({
    Key key,
    this.chooseValue,
    this.title,
    this.item,
    this.onChanged,
    @required this.icon,
    this.errorText,
  }) : super(key: key);

  final String chooseValue;
  final String title;
  final IconData icon;
  final List<String> item;
  final String errorText;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.whiteColor, boxShadow: [
        BoxShadow(color: AppColors.grey200, blurRadius: 5.0, spreadRadius: 3.0),
      ]),
      padding: const EdgeInsets.symmetric(
          //  horizontal: 10,
          vertical: 3),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(
                  icon,
                  color: AppColors.mainColor,
                  size: 20,
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: AppColors.grey300,
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: Column(
                  children: [
                    DropdownButton(
                      hint: chooseValue == null
                          ? Text('$title')
                          : Text(
                              chooseValue,
                              style: TextStyle(color: AppColors.blackColor),
                            ),
                      isExpanded: true,
                      underline: Container(),
                      iconSize: 30.0,
                      style: TextStyle(color: AppColors.blackColor),
                      items: item.map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: onChanged,
                    ),
                    (errorText == null)
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Text(
                                      errorText,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.red.shade800,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
