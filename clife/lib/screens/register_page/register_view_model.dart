import 'package:clife/app/locator.dart';
import 'package:clife/model/user_data.dart';
import 'package:clife/prefrence_util/Prefs.dart';
import 'package:clife/screens/blood_type/blood_type_page.dart';
import 'package:clife/services/api_services.dart';
import 'package:clife/util/app_helper.dart';
import 'package:clife/util/common_pattern.dart';
import 'package:clife/util/constants.dart';
import 'package:clife/util/dialog_helper.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier with AppHelper {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _apiService = locator<ApiService>();

  int bloodDonarGroupValue = -1;
  int smokingGroupValue = -1;
  int alcoholGroupValue = -1;
  int vegNonvegGroupValue = -1;
  int anyMedicalGroupValue = -1;
  int genderGroupValue = -1;

  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final pincodeConntroller = TextEditingController();
  final stateControler = TextEditingController();
  final cityController = TextEditingController();
  final medicalHistoryController = TextEditingController();

  String mobileNo;

  initData(String number) {
    mobileNo = number;
    mobileController.text = mobileNo;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime currentdate = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate:
            DateTime(currentdate.year - 18, currentdate.month, currentdate.day),
        firstDate: DateTime(1960),
        lastDate: DateTime(
            currentdate.year - 18, currentdate.month, currentdate.day + 1));
    if (pickedDate != null) {
      final dob = Utility.formattedDeviceDate(pickedDate);
      dobController.text = dob;
      notifyListeners();
    }
  }

  void validateForm(BuildContext context) async {
    if (!formKey.currentState.validate() ||
        bloodDonarGroupValue == -1 ||
        genderGroupValue == -1 ||
        smokingGroupValue == -1 ||
        alcoholGroupValue == -1 ||
        vegNonvegGroupValue == -1) {
      Utility.showSnackBar(context, "Please fill required detaiils");
    } else {
      UserData data = await _getUpdatedUserData();
      Utility.pushToNext(
          context,
          BloodGroupPage(
            data: data,
          ));
    }
  }

  Future<UserData> _getUpdatedUserData() async {
    UserData userData = UserData();
    userData.firstName = firstNameController.text;
    userData.middleName = middleNameController.text;
    userData.lastName = lastNameController.text;
    userData.email = emailController.text;
    userData.phone = mobileController.text;
    userData.birthDate = dobController.text;
    userData.address = addressController.text;
    userData.area = areaController.text;
    userData.pincode = pincodeConntroller.text;
    userData.city = cityController.text;
    userData.state = stateControler.text;
    userData.medicalHistory = medicalHistoryController.text;
    userData.lastBloodDonation = (bloodDonarGroupValue == 0) ? "Yes" : "No";
    userData.gender = (genderGroupValue == 0) ? "Male" : "Female";
    ;
    userData.smoking = (smokingGroupValue == 0)
        ? "Regular"
        : (smokingGroupValue == 1)
            ? "Occasionally"
            : "No";
    userData.alcohal = (alcoholGroupValue == 0)
        ? "Regular"
        : (smokingGroupValue == 1)
            ? "Occasionally"
            : "No";
    userData.vegNonVeg = (vegNonvegGroupValue == 0) ? "Veg" : "Non Veg";
    userData.fcm_token = await Prefs.fcmToken;

    return userData;
  }

  _register(BuildContext context) async {
    try {
      progressDialog("Please wait...", context);
      final response = await _apiService.loginUser(mobileNo);
      hideProgressDialog(context);
    } catch (e) {
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }

  fetchPinCode(String value, BuildContext context) async {
    final valid = RegExp(CommonPattern.pincodeRegex).hasMatch(value);
    if (valid) {
      try {
        progressDialog("Please wait...", context);
        final response = await _apiService.fetchCityState(value);
        hideProgressDialog(context);
        final list = response.data;
        if(list.isNotEmpty){
           stateControler.text = list[0].state;
        cityController.text = list[0].district;
        }
       
        notifyListeners();
      } catch (e) {
        hideProgressDialog(context);
        Utility.showSnackBar(context, e.toString());
      }
    }
  }
}
