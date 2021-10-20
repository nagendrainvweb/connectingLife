import 'package:clife/app/app_repo.dart';
import 'package:clife/app/locator.dart';
import 'package:clife/model/user_data.dart';
import 'package:clife/prefrence_util/Prefs.dart';
import 'package:clife/screens/register_page/register_page.dart';
import 'package:clife/services/api_services.dart';
import 'package:clife/util/app_helper.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpViewModel extends ChangeNotifier with AppHelper {
  final otpController = TextEditingController();
  bool _otpError = false;
  final _apiService = locator<ApiService>();

  String _acutalOtp;
  String _mobileNo;
  int _timer = 0;
  String _token;

  String get userdata => _token;
  void setToken(String data) {
    _token = data;
    notifyListeners();
  }

  int get timer => _timer;
  void setTimer(int value) {
    _timer = value;
    notifyListeners();
  }

  String get mobileNo => _mobileNo;
  void setMobileNo(String value) {
    _mobileNo = value;
    notifyListeners();
  }

  String get actualOtp => _acutalOtp;
  void setActualOtp(String value) {
    _acutalOtp = value;
    notifyListeners();
  }

  bool get otpError => _otpError;
  void setOtpError(bool value) {
    _otpError = value;
    notifyListeners();
  }

  initData(String mobileNo, String otp, String data) {
    setMobileNo(mobileNo);
    setActualOtp(otp);
    setToken(data);
    setTimer(20);
    startTimer();
  }

  startTimer() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (_timer != 0) {
        _timer--;
        notifyListeners();
        startTimer();
      }
    });
  }

  onResendClicked(BuildContext context) async {
    try {
      progressDialog("Please wait...", context);
      final response = await _apiService.sendOtp(mobileNo);
      hideProgressDialog(context);
      setToken(response.token);
      setActualOtp(response.otp);
      setTimer(20);
      startTimer();
    } catch (e) {
      hideProgressDialog(context);
      Utility.showSnackBar(context, e.toString());
    }
  }

  void verifyUser(BuildContext context) {
    if (_token != null) {
      setLogin(context, _token);
    } else {
      Utility.pushToNext(
          context,
          RegisterPage(
            mobileNo: mobileNo,
          ));
    }
  }

  setLogin(BuildContext context, String token) async {
    await Prefs.setLogin(true);
    await Prefs.setToken(token);
    _timer = 0;
    // await Prefs.setUserId(_userData.userId.toString());
    // await Prefs.setName(_userData.name);
    // await Prefs.setEmailId(_userData.email);
    // await Prefs.setMobileNumber(_userData.mobile);
    // await Prefs.setRole(_userData.registrationAs);
    // Provider.of<AppRepo>(context, listen: false).setUserData(_userData);
    Provider.of<AppRepo>(context, listen: false).init();
    Provider.of<AppRepo>(context, listen: false).fetchUserDetails();
    Utility.pushToDashBoard(context);
  }
}
