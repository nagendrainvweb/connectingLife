import 'package:clife/app/app_helper.dart';
import 'package:clife/util/common_pattern.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/cupertino.dart';

class PostViewModel extends ChangeNotifier with AppHelper {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
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
  bool isStateError = false;
  bool isCityError = false;
  bool isContactPersonName = false;
  bool isContactPersonMobile = false;

  void validateForm() {
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
      myPrint("all good");
    } else {
      myPrint("all is not good");
    }
  }

  _checkFeilds() {
    isNameError =
        !RegExp(CommonPattern.name_regex).hasMatch(nameController.text);
    isDonationTypeError = donationTypeValue == null;
    isAgeEror = ageController.text.isEmpty;
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
}
