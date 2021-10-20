import 'package:clife/app/locator.dart';
import 'package:clife/screens/otp_screen/otp_page.dart';
import 'package:clife/services/api_services.dart';
import 'package:clife/util/app_helper.dart';
import 'package:clife/util/common_pattern.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier with AppHelper {
  final numberController = TextEditingController();
  bool _numberError = false;
  final _apiService = locator<ApiService>();

  bool get numberError => _numberError;

  void setNumberError(bool value) {
    _numberError = value;
    notifyListeners();
  }

  void onMobileChanged(String value) {
    // myPrint("vaue is $value");
    _numberError = !RegExp(CommonPattern.mobile_regex).hasMatch(value);
    notifyListeners();
  }

  loginPressed(BuildContext context) async {
    try {
      progressDialog("Please wait...", context);
      final response = await _apiService.sendOtp(numberController.text);
      hideProgressDialog(context);

      Utility.pushToNext(
          context,
          OtpPage(
            mobileNo: numberController.text,
            otp: response.otp,
            token: response.token,
          ));
    } catch (e) {
      hideProgressDialog(context);
      Utility.showSnackBar(context, e.toString());
    }
  }
}
