// @dart=2.10
import 'package:clife/util/constants.dart';

class BasicResponse<T> {
  var timestamp;
  var status;
  var code;
  var message;
  var isUpdate;
  bool success;
  int cartCount;
  bool isForce;
  String pageContent;
  String pageName;
  String token;
  String otp;
  String image_url;
  String nextPageUrl;
  T data;
  List<int> hasSubCategories;

  BasicResponse(
      {this.timestamp,
      this.status,
      this.code,
      this.message,
      this.data,
      this.isForce,
      this.isUpdate,
      this.pageName,
      this.pageContent,
      this.cartCount,
      this.otp,
      this.nextPageUrl,
      this.token,
      this.hasSubCategories,
      this.image_url});

  factory BasicResponse.fromJson({Map<String, dynamic> json, var data}) {
    try {
      return BasicResponse(
          timestamp: json[Constants.TIMESTAMP],
          status: json[Constants.STATUS],
          code: json[Constants.CODE],
          message: json[Constants.MESSAGE],
          cartCount: json['cart_count'],
          isUpdate: json['isUpdate'],
          pageContent: json["page_content"],
          pageName: json["page_name"],
          isForce: json["isForce"],
          otp: json["otp"].toString(),
          token: json['token'],
          image_url: json["image_url"],
          nextPageUrl: json['next_page_url'],
          data: data,
          hasSubCategories: json['hasSubCategories']?.cast<int>());
    } catch (e) {
      throw Exception(e);
    }
  }
}
