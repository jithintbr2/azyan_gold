class ProfileModel {
  bool status;
  String message;
  Data data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String customerId;
  String mobileNumber;
  String firstName;
  String lastName;
  String presentAddressLine1;
  String presentAddressLine2;
  String presentPostOffice;
  String presentStateId;
  String presentDistrictId;
  String presentPincode;
  String permenentAddressLine1;
  String permenentAddressLine2;
  String permenentPostOffice;
  String permenentStateId;
  String permenentDistrictId;
  String permenentPincode;
  String emailId;
  String dateOfBirth;
  String spouceName;
  String nomineeName;

  Data(
      {this.customerId,
        this.mobileNumber,
        this.firstName,
        this.lastName,
        this.presentAddressLine1,
        this.presentAddressLine2,
        this.presentPostOffice,
        this.presentStateId,
        this.presentDistrictId,
        this.presentPincode,
        this.permenentAddressLine1,
        this.permenentAddressLine2,
        this.permenentPostOffice,
        this.permenentStateId,
        this.permenentDistrictId,
        this.permenentPincode,
        this.emailId,
        this.dateOfBirth,
        this.spouceName,
        this.nomineeName});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    mobileNumber = json['mobileNumber'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    presentAddressLine1 = json['presentAddressLine1'];
    presentAddressLine2 = json['presentAddressLine2'];
    presentPostOffice = json['presentPostOffice'];
    presentStateId = json['presentStateId'];
    presentDistrictId = json['presentDistrictId'];
    presentPincode = json['presentPincode'];
    permenentAddressLine1 = json['permenentAddressLine1'];
    permenentAddressLine2 = json['permenentAddressLine2'];
    permenentPostOffice = json['permenentPostOffice'];
    permenentStateId = json['permenentStateId'];
    permenentDistrictId = json['permenentDistrictId'];
    permenentPincode = json['permenentPincode'];
    emailId = json['emailId'];
    dateOfBirth = json['dateOfBirth'];
    spouceName = json['spouceName'];
    nomineeName = json['nomineeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['mobileNumber'] = this.mobileNumber;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['presentAddressLine1'] = this.presentAddressLine1;
    data['presentAddressLine2'] = this.presentAddressLine2;
    data['presentPostOffice'] = this.presentPostOffice;
    data['presentStateId'] = this.presentStateId;
    data['presentDistrictId'] = this.presentDistrictId;
    data['presentPincode'] = this.presentPincode;
    data['permenentAddressLine1'] = this.permenentAddressLine1;
    data['permenentAddressLine2'] = this.permenentAddressLine2;
    data['permenentPostOffice'] = this.permenentPostOffice;
    data['permenentStateId'] = this.permenentStateId;
    data['permenentDistrictId'] = this.permenentDistrictId;
    data['permenentPincode'] = this.permenentPincode;
    data['emailId'] = this.emailId;
    data['dateOfBirth'] = this.dateOfBirth;
    data['spouceName'] = this.spouceName;
    data['nomineeName'] = this.nomineeName;
    return data;
  }
}