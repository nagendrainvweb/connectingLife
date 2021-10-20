class UserData {
  String name;
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String birthDate;
  String email;
  String phone;
  String username;
  String status;
  String uuid;
  int roleId;
  String updatedAt;
  String createdAt;
  int id;
  //extra feilds
  String address;
  String area;
  String pincode;
  String city;
  String state;
  String country = "India";
  String lastBloodDonation;
  String smoking;
  String alcohal;
  String vegNonVeg;
  String medicalHistory;
  String bloodType;
  String fcm_token;

  UserData(
      {this.name,
      this.firstName,
      this.middleName,
      this.lastName,
      this.gender,
      this.birthDate,
      this.email,
      this.phone,
      this.username,
      this.address,
      this.bloodType,
      this.area,
      this.pincode,
      this.city,
      this.state,
      this.fcm_token,
      this.country,
      this.lastBloodDonation,
      this.smoking,
      this.alcohal,
      this.vegNonVeg,
      this.medicalHistory,
      this.status,
      this.uuid,
      this.roleId,
      this.updatedAt,
      this.createdAt,
      this.id});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    status = json['status'];
    uuid = json['uuid'];
    roleId = json['role_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    if (json["address"] != null) {
      final addressJson = json["address"];
      address = addressJson['address_line'];
      area = addressJson['address_line_2'];
      pincode = addressJson['postal_code'];
      state = addressJson['state'];
      city = addressJson['city'];
    }
    if (json["attrs"] != null) {
      final attrJson = json["attrs"];
      lastBloodDonation = attrJson['last_blood_donor_date'];
      smoking = attrJson['smoking'];
      alcohal = attrJson['alcohal'];
      vegNonVeg = attrJson['veg_nonveg'];
      medicalHistory = attrJson['medial_history'];
      bloodType = attrJson['blood_group'];
    }

    fcm_token = json['push_notification_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['dob'] = this.birthDate;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    // data['status'] = this.status;
    // data['uuid'] = this.uuid;
    //data['role_id'] = this.roleId;
    //data['updated_at'] = this.updatedAt;
    //data['created_at'] = this.createdAt;
    // data['id'] = this.id;
    data['address'] = address;
    data['address_2'] = area;
    data['postal_code'] = pincode;
    data['state'] = state;
    data['city'] = city;
    data['country'] = "India";
    data['last_blood_donor_date'] = lastBloodDonation;
    data['smoking'] = smoking;
    data['alcohal'] = alcohal;
    data['veg_nonveg'] = vegNonVeg;
    data['medial_history'] = medicalHistory;
    data['blood_group'] = bloodType;
    data['push_notification_token'] = fcm_token;
    return data;
  }
}
