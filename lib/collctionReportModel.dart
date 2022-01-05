class CollectionReportModel {
  bool status;
  String message;
  List<Data> data;

  CollectionReportModel({this.status, this.message, this.data});

  CollectionReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int tempId;
  int schemeMasterId;
  int amount;
  int mobileNumber;
  String firstName;
  int referenceId;
  String txStatus;
  String date;
  String schemeNo;
  String schemeName;

  Data(
      {this.tempId,
        this.schemeMasterId,
        this.amount,
        this.mobileNumber,
        this.firstName,
        this.referenceId,
        this.txStatus,
        this.date,
        this.schemeNo,
        this.schemeName});

  Data.fromJson(Map<String, dynamic> json) {
    tempId = json['temp_id'];
    schemeMasterId = json['scheme_master_id'];
    amount = json['amount'];
    mobileNumber = json['mobile_number'];
    firstName = json['first_name'];
    referenceId = json['referenceId'];
    txStatus = json['txStatus'];
    date = json['date'];
    schemeNo = json['scheme_no'];
    schemeName = json['scheme_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp_id'] = this.tempId;
    data['scheme_master_id'] = this.schemeMasterId;
    data['amount'] = this.amount;
    data['mobile_number'] = this.mobileNumber;
    data['first_name'] = this.firstName;
    data['referenceId'] = this.referenceId;
    data['txStatus'] = this.txStatus;
    data['date'] = this.date;
    data['scheme_no'] = this.schemeNo;
    data['scheme_name'] = this.schemeName;
    return data;
  }
}