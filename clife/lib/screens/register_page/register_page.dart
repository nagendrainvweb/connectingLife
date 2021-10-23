import 'package:clife/app_widget/app_textfield.dart';
import 'package:clife/app_widget/button_widget.dart';
import 'package:clife/screens/blood_type/blood_type_page.dart';
import 'package:clife/screens/register_page/register_view_model.dart';
import 'package:clife/util/app_color.dart';
import 'package:clife/util/common_pattern.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key, @required this.mobileNo}) : super(key: key);

  final String mobileNo;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      onModelReady: (RegisterViewModel model) =>
          model.initData(widget.mobileNo),
      builder: (_, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: AppColors.textColor),
          title: Text(
            "Register",
            style: TextStyle(color: AppColors.textColor),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Form(
              key: model.formKey,
              child: Column(
                children: [
                  // Container(
                  //   padding: EdgeInsets.only(
                  //     top: 30,
                  //   ),
                  //   child: Text(
                  //     "User Registration",
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),

                  AppTextfield(
                    controller: model.firstNameController,
                    validator: (String value) =>
                        !RegExp(CommonPattern.name_regex).hasMatch(value)
                            ? "Enter Valid First Name"
                            : null,
                    icon: Icons.person_outlined,
                    hint: "First Name",
                  ),
                  SizedBox(height: 12),
                  AppTextfield(
                    controller: model.middleNameController,
                    validator: (String value) =>
                        !RegExp(CommonPattern.name_regex).hasMatch(value)
                            ? "Enter Valid Middle Name"
                            : null,
                    icon: Icons.person_outlined,
                    hint: "Middle Name",
                  ),
                  SizedBox(height: 12),
                  AppTextfield(
                    controller: model.lastNameController,
                    validator: (String value) =>
                        !RegExp(CommonPattern.name_regex).hasMatch(value)
                            ? "Enter Valid Last Name"
                            : null,
                    icon: Icons.person_outlined,
                    hint: "Last Name",
                  ),
                  SizedBox(height: 12),
                  AppTextfield(
                    controller: model.emailController,
                    validator: (String value) =>
                        !RegExp(CommonPattern.email_regex).hasMatch(value)
                            ? "Enter Valid Email Address"
                            : null,
                    icon: Icons.email_outlined,
                    hint: "Email",
                  ),
                  SizedBox(height: 12),
                  AppTextfield(
                    enable: false,
                    controller: model.mobileController,
                    validator: (String value) =>
                        !RegExp(CommonPattern.mobile_regex).hasMatch(value)
                            ? "Enter Valid Mobile No"
                            : null,
                    icon: Icons.phone_outlined,
                    hint: "Mobile",
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () => model.selectDate(context),
                    child: AppTextfield(
                      controller: model.dobController,
                      validator: (String value) =>
                          value.isEmpty ? "Enter Valid First Name" : null,
                      enable: false,
                      icon: Icons.calendar_today_outlined,
                      hint: "Date of Birth (DD-MM-YYYY)",
                    ),
                  ),
                  SizedBox(height: 12),
                  AppTextfield(
                    controller: model.addressController,
                    validator: (String value) =>
                        !RegExp(CommonPattern.addressRegex).hasMatch(value)
                            ? "Enter Valid Address"
                            : null,
                    icon: Icons.location_city_outlined,
                    hint: "Address",
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextfield(
                          controller: model.areaController,
                          validator: (String value) =>
                              !RegExp(CommonPattern.addressRegex)
                                      .hasMatch(value)
                                  ? "Enter Valid Area "
                                  : null,
                          icon: Icons.location_city,
                          hint: "Area",
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: AppTextfield(
                          controller: model.pincodeConntroller,
                          onChanged: (String value)=>model.fetchPinCode(value, context),
                          validator: (String value) =>
                              !RegExp(CommonPattern.pincodeRegex)
                                      .hasMatch(value)
                                  ? "Enter Valid Pincode"
                                  : null,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          icon: Icons.location_city,
                          hint: "Pin Code",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  AppTextfield(
                    controller: model.cityController,
                    // validator: (String value) =>
                    //     !RegExp(CommonPattern.name_regex).hasMatch(value)
                    //         ? "Enter Valid City Name"
                    //         : null,
                    enable: false,
                    icon: Icons.location_city,
                    hint: "City",
                  ),
                  SizedBox(height: 12),
                  AppTextfield(
                    controller: model.stateControler,
                    // validator: (String value) =>
                    //     !RegExp(CommonPattern.name_regex).hasMatch(value)
                    //         ? "Enter Valid State Name"
                    //         : null,
                    icon: Icons.location_city,
                    hint: "State",
                    enable: false,
                  ),
                  SizedBox(height: 12),
                  AppTextfield(
                    controller: model.medicalHistoryController,
                    hint: "Any Medical History (optional)",
                    maxLines: 4,
                    icon: Icons.medical_services_outlined,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Are you a regular blood donor ?",
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 0,
                                      groupValue: model.bloodDonarGroupValue,
                                      title: Text("Yes"),
                                      onChanged: (newValue) => setState(() =>
                                          model.bloodDonarGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      groupValue: model.bloodDonarGroupValue,
                                      title: Text("No"),
                                      onChanged: (newValue) => setState(() =>
                                          model.bloodDonarGroupValue = newValue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Gender",
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 0,
                                      groupValue: model.genderGroupValue,
                                      title: Text("Male"),
                                      onChanged: (newValue) => setState(
                                          () => model.genderGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      groupValue: model.genderGroupValue,
                                      title: Text("Female"),
                                      onChanged: (newValue) => setState(
                                          () => model.genderGroupValue = newValue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Are you a Smoker ?",
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              // RadioLabelWidget(
                              //   value: 0,
                              //   groupValue: _smokingGroupValue,
                              //   title: Text("Regular"),
                              //   onChanged: (newValue) => setState(
                              //       () => _smokingGroupValue = newValue),

                              // ),
                              // RadioLabelWidget(
                              //   value: 0,
                              //   groupValue: _smokingGroupValue,
                              //   title: Text("Regular"),
                              //   onChanged: (newValue) => setState(
                              //       () => _smokingGroupValue = newValue),

                              // ),
                              // RadioLabelWidget(
                              //   value: 2,
                              //   groupValue: _smokingGroupValue,
                              //   title: Text("No"),
                              //   onChanged: (newValue) => setState(
                              //       () => _smokingGroupValue = newValue),

                              // ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 0,
                                      groupValue: model.smokingGroupValue,
                                      title: Text("Regular"),
                                      onChanged: (newValue) => setState(
                                          () => model.smokingGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      groupValue: model.smokingGroupValue,
                                      title: Text("Occasionally"),
                                      onChanged: (newValue) => setState(
                                          () => model.smokingGroupValue = newValue),
                                    ),
                                  ),
                                  // Expanded(
                                  //   flex: 1,
                                  //   child: RadioLabelWidget(
                                  //     value: 2,
                                  //     groupValue: _smokingGroupValue,
                                  //     title: Text("No"),
                                  //     onChanged: (newValue) => setState(
                                  //         () => _smokingGroupValue = newValue),

                                  //   ),
                                  // ),
                                ],
                              ),
                              RadioLabelWidget(
                                value: 2,
                                groupValue: model.smokingGroupValue,
                                title: Text("No"),
                                onChanged: (newValue) => setState(
                                    () => model.smokingGroupValue = newValue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Are you Drinking Alcohol ?",
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 0,
                                      groupValue: model.alcoholGroupValue,
                                      title: Text("Regular"),
                                      onChanged: (newValue) => setState(
                                          () => model.alcoholGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      groupValue: model.alcoholGroupValue,
                                      title: Text("Occasionally"),
                                      onChanged: (newValue) => setState(
                                          () => model.alcoholGroupValue = newValue),
                                    ),
                                  ),
                                ],
                              ),
                              RadioLabelWidget(
                                value: 2,
                                groupValue: model.alcoholGroupValue,
                                title: Text("No"),
                                onChanged: (newValue) => setState(
                                    () => model.alcoholGroupValue = newValue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Veg/Non Veg",
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 0,
                                      groupValue: model.vegNonvegGroupValue,
                                      title: Text("Veg"),
                                      onChanged: (newValue) => setState(() =>
                                          model.vegNonvegGroupValue = newValue),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RadioLabelWidget(
                                      value: 1,
                                      groupValue: model.vegNonvegGroupValue,
                                      title: Text("Non Veg"),
                                      onChanged: (newValue) => setState(() =>
                                          model.vegNonvegGroupValue = newValue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Container(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 8.0),
                  //         child: Text(
                  //           "Any Medical History",
                  //         ),
                  //       ),
                  //       Container(
                  //         child: Column(
                  //           children: <Widget>[
                  //             Row(
                  //               children: <Widget>[
                  //                 Expanded(
                  //                   flex: 1,
                  //                   child: RadioLabelWidget(
                  //                     value: 0,
                  //                     groupValue: _anyMedicalGroupValue,
                  //                     title: Text("Yes"),
                  //                     onChanged: (newValue) => setState(() =>
                  //                         _anyMedicalGroupValue = newValue),

                  //                   ),
                  //                 ),
                  //                 Expanded(
                  //                   flex: 1,
                  //                   child: RadioLabelWidget(
                  //                     value: 1,
                  //                     groupValue: _anyMedicalGroupValue,
                  //                     title: Text("No"),
                  //                     onChanged: (newValue) => setState(() =>
                  //                         _anyMedicalGroupValue = newValue),

                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  SizedBox(
                    height: 40,
                  ),
                  ButtonView(
                    buttonText: "Continue",
                    textColor: AppColors.whiteColor,
                    color: AppColors.mainColor,
                    onPressed: () {
                      model.validateForm(context);
                     
                      // Utility.pushToNext(context, BloodGroupPage());
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioLabelWidget extends StatelessWidget {
  const RadioLabelWidget(
      {Key key, this.value, this.groupValue, this.title, this.onChanged})
      : super(key: key);

  final int value, groupValue;
  final Widget title;
  final Function(int value) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            children: [
              Radio(
                  visualDensity: VisualDensity.compact,
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged),
              Expanded(child: title)
            ],
          )
          // child: RadioListTile(
          //   value: 0,
          //   groupValue: _smokingGroupValue,
          //   title: Text("Regular"),
          //   onChanged: (newValue) => setState(() => _smokingGroupValue = newValue),
          //   activeColor: Colors.red,
          //   selected: false,
          // ),
          ),
    );
  }
}
