import 'package:clife/app/app_helper.dart';
import 'package:clife/app/locator.dart';
import 'package:clife/services/api_services.dart';
import 'package:clife/util/common_pattern.dart';
import 'package:clife/util/dialog_helper.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';

class PostViewModel extends ChangeNotifier with AppHelper {
  final _apiService = locator<ApiService>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final unitController = TextEditingController();
  final hospitalNameController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final pincodeController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactPersonMobileController = TextEditingController();
  final messageController = TextEditingController();

  String dropDownValue;
  String genderValue;
  String donationTypeValue;

  bool isNameError = false;
  bool isAgeEror = false;
  bool isDonationTypeError = false;
  bool isGenderError = false;
  bool isBloodGroupError = false;
  bool isHospitalNameEror = false;
  bool isAddressError = false;
  bool isAreaError = false;
  bool isPincodeError = false;
  bool isUnitError = false;
  bool isStateError = false;
  bool isCityError = false;
  bool isContactPersonName = false;
  bool isContactPersonMobile = false;

  void validateForm(BuildContext context) {
    _checkFeilds();
    if (!isNameError &&
        !isDonationTypeError &&
        !isAgeEror &&
        !isGenderError &&
        !isBloodGroupError &&
        !isHospitalNameEror &&
        !isAddressError &&
        !isPincodeError &&
        !isStateError &&
        !isCityError &&
        !isContactPersonName &&
        !isContactPersonMobile) {
      _postRequirement(context);
    } else {
      myPrint("all is not good");
    }
  }

  _postRequirement(BuildContext context) async {
    progressDialog("Please wait...", context);
    try {
      final patientName = nameController.text;
      final age = ageController.text;
      final noOfUnit = unitController.text;
      final contactPersonName = contactPersonController.text;
      final contactPersonMobile = contactPersonMobileController.text;
      final message = messageController.text;
      final hospialName = hospitalNameController.text;
      final address = addressController.text;
      final area = areaController.text;
      final city = cityController.text;
      final state = stateController.text;
      final pincode = pincodeController.text;

      double lat, lng;
      List<Location> locations = await locationFromAddress(
          "$hospialName, $address, $area, $city, $state, - $pincode");
      if (locations.isNotEmpty) {
        lat = locations[0].latitude;
        lng = locations[0].longitude;
      }

      final response = await _apiService.postRequirement(
          donationTypeValue,
          age,
          genderValue,
          hospialName,
          address,
          area,
          dropDownValue,
          city,
          pincode,
          state,
          city,
          contactPersonName,
          contactPersonMobile,
          message,
          "",
          noOfUnit,
          patientName,
          lat,
          lng);
      hideProgressDialog(context);
      //Navigator.pop(context);
      DialogHelper.showErrorDialog(context, "Done", response.message,
          onOkClicked: () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString());
    }
  }

  _checkFeilds() {
    isNameError =
        !RegExp(CommonPattern.name_regex).hasMatch(nameController.text);
    isDonationTypeError = donationTypeValue == null;
    isAgeEror = ageController.text.isEmpty;
    isUnitError = unitController.text.isEmpty;
    isGenderError = genderValue == null;
    isBloodGroupError = dropDownValue == null;
    isHospitalNameEror =
        !RegExp(CommonPattern.name_regex).hasMatch(hospitalNameController.text);
    isAddressError =
        !RegExp(CommonPattern.addressRegex).hasMatch(addressController.text);
    isPincodeError =
        !RegExp(CommonPattern.pincodeRegex).hasMatch(pincodeController.text);
    isStateError =
        !RegExp(CommonPattern.name_regex).hasMatch(stateController.text);
    isCityError =
        !RegExp(CommonPattern.name_regex).hasMatch(cityController.text);
    isContactPersonName = !RegExp(CommonPattern.name_regex)
        .hasMatch(contactPersonController.text);
    isContactPersonMobile = !RegExp(CommonPattern.mobile_regex)
        .hasMatch(contactPersonMobileController.text);
    notifyListeners();
  }

  fetchPinCode(String value, BuildContext context) async {
    final valid = RegExp(CommonPattern.pincodeRegex).hasMatch(value);
    if (valid) {
      try {
        progressDialog("Please wait...", context);
        final response = await _apiService.fetchCityState(value);
        hideProgressDialog(context);
        final list = response.data;
        if (list.isNotEmpty) {
          stateController.text = list[0].state;
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
