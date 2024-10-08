import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clife/model/basic_response.dart';
import 'package:clife/model/post_data.dart';
import 'package:clife/model/postal_data.dart';
import 'package:clife/model/user_data.dart';
import 'package:clife/prefrence_util/Prefs.dart';
import 'package:clife/services/api_error_exception.dart';
import 'package:clife/services/urlList.dart';
import 'package:clife/util/constants.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  get getDefaultHeader => {"Accept": "application/json"};
  Future<BasicResponse<String>> registerUser(UserData userData) async {
    try {
      final header = {"Content-Type": "application/json"};
      header.addAll(getDefaultHeader);
      final body = json.encode(userData.toJson());
      myPrint("body is " + body.toString());
      final request = await http.post(Uri.parse(UrlList.REGISTER),
          body: body, headers: header);
      myPrint("register response : ${request.body.toString()}");
      final jsonResponse = json.decode(request.body);
      if (jsonResponse[Constants.STATUS] == Constants.SUCCESS) {
        final data = jsonResponse[Constants.DATA];
        // if (data != null) {
        return BasicResponse<String>.fromJson(
            json: jsonResponse, data: data["token"]);
        //  }
      }
      throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      myPrint(e.toString());
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }

  Future<BasicResponse<List<PostalData>>> fetchCityState(String pincode) async {
    try {
      myPrint("url is ${UrlList.PINCODE + pincode}");
      final request = await http.get(Uri.parse(UrlList.PINCODE + pincode));
      final jsonResponse = json.decode(request.body);
      myPrint("register response : ${request.body.toString()}");
      final Map<String, dynamic> data = new Map<String, dynamic>();
      if (jsonResponse["status"] == Constants.SUCCESS) {
        final data = jsonResponse['data'];
        final List<PostalData> postalList = [];
        for (var e in data) {
          postalList.add(PostalData.fromJson(e));
        }
        return BasicResponse.fromJson(json: jsonResponse, data: postalList);
      }
      throw ApiErrorException(jsonResponse['message']);

      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }

  Future<BasicResponse<String>> postRequirement(
      String type,
      String age,
      String gender,
      String hospitalName,
      String address,
      String area,
      String bloodGroup,
      String city,
      String pincode,
      String state,
      String country,
      String contactPersonName,
      String contactPersonMobile,
      String message,
      String unit,
      String unitQty,
      String patientName,
      double latitude,
      double longitude) async {
    try {
      myPrint(" url is " + UrlList.POST_REQUIREMENT);
      final token = await Prefs.token;
      final header = {"Authorization": "Bearer $token"};
      header.addAll(getDefaultHeader);
      final body = {
        "type": "$type",
        "age": "$age",
        "gender": "$gender",
        "hospital_name": "$hospitalName",
        "address": "$address",
        "area": "$area",
        "blood_group": "$bloodGroup",
        "city": "$city",
        "pincode": "$pincode",
        "state": "$state",
        "country": "$country",
        "contact_person_name": "$contactPersonName",
        "contact_person_mobile": "$contactPersonMobile",
        "message": "$message",
        "unit": "Litre",
        "unit_qty": "$unit",
        "patient_name": "$patientName",
        "latitude": "$latitude",
        "longitude": "$longitude",
      };
      final request = await http.post(Uri.parse(UrlList.POST_REQUIREMENT),
          body: body, headers: header);
      final jsonResponse = json.decode(request.body);
      myPrint(request.body);
      if (jsonResponse["status"] == Constants.SUCCESS) {
        final data = jsonResponse[Constants.DATA];
        // List<AgentData> list = [];
        // for (var item in data) {
        //   list.add(AgentData.fromJson(item));
        // }
        return BasicResponse<String>.fromJson(json: jsonResponse, data: "");
      }
      throw ApiErrorException(jsonResponse['message']);
      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }

  Future<BasicResponse<List<PostData>>> fetchPostList(int page) async {
    try {
      myPrint("url is ${UrlList.POSTED_LIST}");
      final token = await Prefs.token;
      final header = {"Authorization": "Bearer $token"};
      header.addAll(getDefaultHeader);
      myPrint("header is ${header.toString()}");
      final request = await http.get(Uri.parse(UrlList.POST_REQUIREMENT+"?page=$page"),
          headers: header);
      final jsonResponse = json.decode(request.body);
      myPrint("register response : ${request.body.toString()}");
      if (jsonResponse["status"] == Constants.SUCCESS) {
        final data = jsonResponse['data'];
        final List<PostData> postList = [];
        for (var e in data) {
          postList.add(PostData.fromJson(e));
        }
        return BasicResponse.fromJson(json: jsonResponse, data: postList);
      }
      throw ApiErrorException(jsonResponse['message']);

      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }

  // Future<BasicResponse<dynamic>> fileUpload(
  //     List<File> file, List<String> nameList) async {
  //   //create multipart request for POST or PATCH method
  //   final uri = Uri.parse(UrlList.UPLOAD_IMAGE);
  //   var request = http.MultipartRequest(
  //     "POST",
  //     uri,
  //   );

  //   for (var item in file) {
  //     var pic = await http.MultipartFile.fromPath("image[]", item.path);
  //     //add multipart to request
  //     request.files.add(pic);
  //   }
  //   //  myPrint("name is")
  //   request.fields.addAll({'name': "{\"name\":" + jsonEncode(nameList) + "}"});

  //   try {
  //     var response = await request.send();

  //     //Get the response from the server
  //     var responseData = await response.stream.toBytes();
  //     var responseString = String.fromCharCodes(responseData);
  //     print(responseString);

  //     final responseJson = json.decode(responseString);
  //     if (responseJson[Constants.STATUS] == true) {
  //       final data = responseJson[Constants.DATA];
  //       // List<String> list = [];
  //       // for (var item in data) {
  //       //   list.add(item.toString());
  //       // }
  //       return BasicResponse<dynamic>.fromJson(json: responseJson, data: data);
  //     }
  //     throw ApiErrorException(responseJson[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on TimeoutException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     myPrint(e.toString());
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<UserData>> loginUserWithNumber(String mobile) async {
  //   try {
  //     final body = {"mobile": mobile};
  //     final request = await http.post(Uri.parse(UrlList.LOGIN), body: body);
  //     myPrint("login response : ${request.body.toString()}");
  //     final jsonResponse = json.decode(request.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       UserData userData = new UserData();

  //       final data = jsonResponse[Constants.DATA];
  //       if (data != null) {
  //         final oridata = data['original'];
  //         userData = _setUserData(oridata['data']);
  //         userData.otp = jsonResponse['otp'].toString();
  //         return BasicResponse<UserData>.fromJson(
  //             json: jsonResponse, data: userData);
  //       }
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);

  //     //  return BasicResponse.fromJson(json: jsonResponse, data: "");
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  Future<BasicResponse<String>> loginUser(String mobileNo) async {
    try {
      final fcm_token = await Prefs.fcmToken;
      final body = {"mobile_no": mobileNo, "fcm_token": fcm_token};
      final request = await http.post(Uri.parse(UrlList.LOGIN),
          body: body, headers: getDefaultHeader);
      myPrint("login response : ${request.body.toString()}");
      final jsonResponse = json.decode(request.body);
      if (jsonResponse[Constants.STATUS] == true) {
        return BasicResponse<String>.fromJson(json: jsonResponse, data: "");
        // }
      }
      throw ApiErrorException(jsonResponse[Constants.MESSAGE]);

      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }

  Future<BasicResponse<String>> sendOtp(String mobileNo) async {
    try {
      final fcm_token = await Prefs.fcmToken;
      final body = {"phone": mobileNo, "fcm_token": fcm_token};
      final request = await http.post(Uri.parse(UrlList.SEND_OTP),
          body: body, headers: getDefaultHeader);
      myPrint("login response : ${request.body.toString()}");
      final jsonResponse = json.decode(request.body);
      if (jsonResponse[Constants.STATUS] == Constants.SUCCESS) {
        //  final data = jsonResponse[Constants.DATA];
        return BasicResponse<String>.fromJson(json: jsonResponse, data: "");
      }
      throw ApiErrorException(jsonResponse[Constants.MESSAGE]);

      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }

  // UserData _setUserData(var data) {
  //   final profileData = data['profile'];
  //   UserData userData = new UserData.fromJson(profileData);

  //   ContactPerson person;

  //   final role = data['roles'][0];
  //   userData.id = profileData['id'];
  //   userData.userId = profileData['user_id'];
  //   userData.name = data['name'];
  //   userData.email = data['email'];
  //   userData.mobile = profileData['mobile'];
  //   userData.commission_per_assorter =
  //       profileData['commission_per_assorter'].toString();
  //   if (profileData['contact_person_details'] != null) {
  //     final contactPersonJson = profileData['contact_person_details'];
  //     person = ContactPerson();
  //     person.id = contactPersonJson["id"];
  //     person.contactPersonName = contactPersonJson["name"];
  //     person.contactPersonEmail = contactPersonJson["email"];
  //     List list = contactPersonJson["user_profiles"];
  //     if (list.isNotEmpty) {
  //       person.contactPersonMobile =
  //           contactPersonJson["user_profiles"][0]["mobile"];
  //     }

  //     userData.contactPerson = person;
  //   }
  //   //userData.companyName = profileData['company_name'];

  //   userData.registrationAs = role["name"];

  //   return userData;
  // }

  Future<BasicResponse<UserData>> fetchUserDetails() async {
    try {
      //final id = await Prefs.userId;
      //final body = {"user_id": id};
      final token = await Prefs.token;
      final request = await http.get(Uri.parse(UrlList.USER_DETAILS + "$token"),
          headers: getDefaultHeader);
      myPrint("userdetails response : ${request.body.toString()}");
      final jsonResponse = json.decode(request.body);
      if (jsonResponse[Constants.STATUS] == Constants.SUCCESS) {
        final data = jsonResponse[Constants.DATA];
        if (data != null) {
          return BasicResponse<UserData>.fromJson(
              json: jsonResponse, data: UserData.fromJson(data));
        }
      }
      throw ApiErrorException(jsonResponse[Constants.MESSAGE]);

      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }

  // Future<BasicResponse<String>> forgortPassword(String email) async {
  //   try {
  //     final body = {"email": email};
  //     final request =
  //         await http.post(Uri.parse(UrlList.FORGOT_PASSWORD), body: body);
  //     myPrint("login response : ${request.body.toString()}");
  //     final jsonResponse = json.decode(request.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       return BasicResponse.fromJson(json: jsonResponse, data: "");
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<String>> checkUser(String email) async {
  //   try {
  //     final body = {"email": email};
  //     final request =
  //         await http.post(Uri.parse(UrlList.CHECK_USER), body: body);
  //     myPrint("login response : ${request.body.toString()}");
  //     final jsonResponse = json.decode(request.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       return BasicResponse.fromJson(json: jsonResponse, data: "");
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  //   Future<BasicResponse<String>> checkUserMobile(String mobile) async {
  //   try {
  //     final body = {"mobile": mobile};
  //     final request =
  //         await http.post(Uri.parse(UrlList.CHECK_USER_MOBILE), body: body);
  //     myPrint("checkUserMobile response : ${request.body.toString()}");
  //     final jsonResponse = json.decode(request.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       return BasicResponse.fromJson(json: jsonResponse, data: "");
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<String>> changePassword(
  //     String oldPass, String newPass) async {
  //   try {
  //     final userId = await Prefs.userId;

  //     final body = {
  //       "user_id": userId,
  //       "old_password": oldPass,
  //       "new_password": newPass
  //     };
  //     myPrint(body.toString());
  //     final response =
  //         await http.post(Uri.parse(UrlList.CHNAGE_PASSWORD), body: body);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       return BasicResponse.fromJson(json: jsonResponse, data: "");
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<List<AddressData>>> userAddress() async {
  //   try {
  //     final user_id = await Prefs.userId;
  //     final body = {
  //       "user_id": user_id,
  //     };
  //     myPrint(body.toString());
  //     myPrint("url is " + UrlList.USER_ADDRESS);
  //     final response =
  //         await http.post(Uri.parse(UrlList.USER_ADDRESS), body: body);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       final data = jsonResponse[Constants.DATA];
  //       final List<AddressData> addressList = [];
  //       for (var e in data) {
  //         addressList.add(AddressData.fromJson(e));
  //       }
  //       return BasicResponse.fromJson(json: jsonResponse, data: addressList);
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<List<AssorterModal>>> userAssorter() async {
  //   try {
  //     final user_id = await Prefs.userId;
  //     final body = {
  //       "user_id": user_id,
  //     };
  //     myPrint(body.toString());
  //     final response =
  //         await http.post(Uri.parse(UrlList.USER_ASSORTER), body: body);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       final data = jsonResponse[Constants.DATA];
  //       final List<AssorterModal> assorterList = [];
  //       for (var e in data) {
  //         assorterList.add(AssorterModal.fromGetJson(e));
  //       }
  //       return BasicResponse.fromJson(json: jsonResponse, data: assorterList);
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<UserData>> updateUserProfile(
  //     Map<String, dynamic> data) async {
  //   try {
  //     final header = {"Content-Type": "application/json"};
  //     final body = json.encode(data);
  //     myPrint(body.toString());
  //     myPrint("url is " + UrlList.UPDATE_USER_PROFILE);
  //     final response = await http.post(Uri.parse(UrlList.UPDATE_USER_PROFILE),
  //         body: body, headers: header);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       return BasicResponse.fromJson(
  //           json: jsonResponse,
  //           data: UserData.fromJson(jsonResponse[Constants.DATA]));
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<String>> updateUserAgent(
  //     String userAgentId, String userId, String agentId) async {
  //   try {
  //     final body = {
  //       "user_agent_id": userAgentId,
  //       "user_id": userId,
  //       "agent_id": agentId,
  //     };
  //     myPrint(body.toString());
  //     final response =
  //         await http.post(Uri.parse(UrlList.UPDATE_USER_AGENT), body: body);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       // final data = jsonResponse[Constants.DATA];
  //       // final List<AssorterModal> assorterList = [];
  //       // for (var e in data) {
  //       //   assorterList.add(AssorterModal.fromJson(e));
  //       // }
  //       return BasicResponse.fromJson(json: jsonResponse, data: "");
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<AssorterModal>> updateUserAssorter(
  //     AssorterModal assorterModal) async {
  //   try {
  //     final header = {"Content-Type": "application/json"};
  //     final body = json.encode(assorterModal.toJson());
  //     myPrint(body.toString());
  //     final response = await http.post(Uri.parse(UrlList.UPDATE_USER_ASSORTER),
  //         body: body, headers: header);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       // final data = jsonResponse[Constants.DATA];
  //       // final List<AssorterModal> assorterList = [];
  //       // for (var e in data) {
  //       //   assorterList.add(AssorterModal.fromJson(e));
  //       // }
  //       return BasicResponse.fromJson(
  //           json: jsonResponse,
  //           data: AssorterModal.fromJson(jsonResponse[Constants.DATA]));
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<AddressData>> updateUserAddress(
  //     AddressData addressData) async {
  //   try {
  //     final header = {"Content-Type": "application/json"};
  //     final body = json.encode(addressData.toJson());
  //     myPrint(body.toString());
  //     myPrint("url is " + UrlList.UPDATE_USER_ADDRESS);
  //     final response = await http.post(Uri.parse(UrlList.UPDATE_USER_ADDRESS),
  //         body: body, headers: header);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       // final data = jsonResponse[Constants.DATA];
  //       // final List<AssorterModal> assorterList = [];
  //       // for (var e in data) {
  //       //   assorterList.add(AssorterModal.fromJson(e));
  //       // }
  //       return BasicResponse.fromJson(
  //           json: jsonResponse,
  //           data: AddressData.fromJson(jsonResponse[Constants.DATA]));
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<AddressData>> addUserAddress(
  //     AddressData addressData) async {
  //   try {
  //     final userId = await Prefs.userId;
  //     addressData.userId = userId;
  //     List<AddressData> list = [addressData];
  //     final header = {"Content-Type": "application/json"};
  //     List bodyList = list.map((data) => data.toJson()).toList();
  //     final body = json.encode({"addresses": bodyList});
  //     myPrint("url is " + UrlList.ADD_ADDRESS);
  //     myPrint("bosy is " + body.toString());
  //     final response = await http.post(Uri.parse(UrlList.ADD_ADDRESS),
  //         body: body, headers: header);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       final data = jsonResponse[Constants.DATA];

  //       return BasicResponse.fromJson(
  //           json: jsonResponse,
  //           data: AddressData.fromJson(jsonResponse[Constants.DATA][0]));
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<AssorterModal>> addUserAssorter(
  //     AssorterModal data) async {
  //   try {
  //     List<AssorterModal> list = [data];
  //     final header = {"Content-Type": "application/json"};
  //     List bodyList = list.map((data) => data.toJson()).toList();
  //     final body = json.encode({"assorters": bodyList});
  //     myPrint(body.toString());
  //     final response = await http.post(Uri.parse(UrlList.ADD_ASSORTER),
  //         body: body, headers: header);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       final data = jsonResponse[Constants.DATA];
  //       // final List<AssorterModal> assorterList = [];
  //       // for (var e in data) {
  //       //   assorterList.add(AssorterModal.fromJson(e));
  //       // }
  //       return BasicResponse.fromJson(
  //           json: jsonResponse, data: AssorterModal.fromJson(data[0]));
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<String>> deleteAddrress(AddressData data) async {
  //   try {
  //     final header = {"Content-Type": "application/json"};
  //     final body = {"address_id": data.id.toString()};
  //     myPrint(body.toString());
  //     myPrint("url is " + UrlList.DELETE_ADDRESS);
  //     final response =
  //         await http.post(Uri.parse(UrlList.DELETE_ADDRESS), body: body);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       return BasicResponse.fromJson(json: jsonResponse, data: "");
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }

  // Future<BasicResponse<String>> deleteAssorter(AssorterModal data) async {
  //   try {
  //     final header = {"Content-Type": "application/json"};
  //     final body = {"assorter_id": data.id.toString()};
  //     myPrint(body.toString());
  //     myPrint("url is " + UrlList.DELETE_ASSORTER);
  //     final response =
  //         await http.post(Uri.parse(UrlList.DELETE_ASSORTER), body: body);
  //     myPrint(response.body.toString());
  //     final jsonResponse = json.decode(response.body);
  //     if (jsonResponse[Constants.STATUS] == true) {
  //       return BasicResponse.fromJson(json: jsonResponse, data: "");
  //     }
  //     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
  //   } on SocketException catch (e) {
  //     throw ApiErrorException(NO_INTERNET_CONN);
  //   } on Exception catch (e) {
  //     // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
  //     throw ApiErrorException(e.toString());
  //   }
  // }
}
