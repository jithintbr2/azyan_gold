class transactionModel {
  bool status;
  String message;
  Data data;

  transactionModel({this.status, this.message, this.data});

  transactionModel.fromJson(Map<String, dynamic> json) {
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
  int transactionCount;
  int transactionAmount;

  Data({this.transactionCount, this.transactionAmount});

  Data.fromJson(Map<String, dynamic> json) {
    transactionCount = json['TransactionCount'];
    transactionAmount = json['TransactionAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TransactionCount'] = this.transactionCount;
    data['TransactionAmount'] = this.transactionAmount;
    return data;
  }
}