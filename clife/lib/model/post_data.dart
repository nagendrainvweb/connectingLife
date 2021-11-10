import 'package:clife/util/utility.dart';

class PostData {
  String patientName;
  String type;
  String age;
  String gender;
  String hospitalName;
  String addressLine;
  String city;
  String postalCode;
  String state;
  String country;
  String contactPersonName;
  String contactPersonMobile;
  String message;
  String unit;
  String unitQty;
  String status;
  String latitude;
  String longitude;
  String bloodGroup;
  int postedByUserId;
  String updatedAt;
  String createdAt;
  int id;

  PostData(
      {this.patientName,
      this.type,
      this.age,
      this.gender,
      this.hospitalName,
      this.addressLine,
      this.city,
      this.postalCode,
      this.state,
      this.country,
      this.contactPersonName,
      this.contactPersonMobile,
      this.message,
      this.unit,
      this.unitQty,
      this.status,
      this.latitude,
      this.longitude,
      this.bloodGroup,
      this.postedByUserId,
      this.updatedAt,
      this.createdAt,
      this.id});

  PostData.fromJson(Map<String, dynamic> json) {
    patientName = json['patient_name'];
    type = json['type'];
    age = json['age'].toString();
    gender = json['gender'].toString();
    hospitalName = json['hospital_name'];
    addressLine = json['address_line'];
    city = json['city'];
    postalCode = json['postal_code'];
    state = json['state'];
    country = json['country'];
    contactPersonName = json['contact_person_name'];
    contactPersonMobile = json['contact_person_mobile'];
    message = json['message'];
    unit = json['unit'];
    unitQty = json['unit_qty'];
    status = json['status'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    bloodGroup = json['blood_group'];
    postedByUserId = json['posted_by_user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_name'] = this.patientName;
    data['type'] = this.type;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['hospital_name'] = this.hospitalName;
    data['address_line'] = this.addressLine;
    data['city'] = this.city;
    data['postal_code'] = this.postalCode;
    data['state'] = this.state;
    data['country'] = this.country;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_mobile'] = this.contactPersonMobile;
    data['message'] = this.message;
    data['unit'] = this.unit;
    data['unit_qty'] = this.unitQty;
    data['status'] = this.status;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['blood_group'] = this.bloodGroup;
    data['posted_by_user_id'] = this.postedByUserId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }

  String getDate() {
    final dateTime = Utility.parseServerDate(createdAt);
    return Utility.formattedDeviceDate(dateTime);
  }
}
