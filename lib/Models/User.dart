// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);


class User {
  bool status;
  String token;
  int clientId;
  String clientName;
  String clientPhone;
  int clientAge;
  dynamic shopId;

  User({
    this.status,
    this.token,
    this.clientId,
    this.clientName,
    this.clientPhone,
    this.clientAge,
    this.shopId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"] == null ? null : json["status"],
        token: json["token"] == null ? null : json["token"],
        clientId: json["client_id"] == null ? null : json["client_id"],
        clientName: json["client_name"] == null ? null : json["client_name"],
        clientPhone: json["client_phone"] == null ? null : json["client_phone"],
        clientAge: json["client_age"] == null ? null : json["client_age"],
        shopId: json["shop_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "token": token == null ? null : token,
        "client_id": clientId == null ? null : clientId,
        "client_name": clientName == null ? null : clientName,
        "client_phone": clientPhone == null ? null : clientPhone,
        "client_age": clientAge == null ? null : clientAge,
        "shop_id": shopId,
      };
}
