class AuthModel {
  int? status;
  String? message;
  String? object;

  AuthModel({this.status, this.message, this.object});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    object = json['object'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['object'] = this.object;
    return data;
  }
}
