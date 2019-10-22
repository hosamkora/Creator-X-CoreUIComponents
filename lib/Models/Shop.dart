class Shop {
  bool status;
  int shopId;
  String shopName;
  String shopAddress;
  String shopPhone;
  Null shopImage;
  String shopLongitude;
  String shopLatitude;
  List<WorkingTimes> workingTimes;

  Shop(
      {this.status,
      this.shopId,
      this.shopName,
      this.shopAddress,
      this.shopPhone,
      this.shopImage,
      this.shopLongitude,
      this.shopLatitude,
      this.workingTimes});

  Shop.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopAddress = json['shop_address'];
    shopPhone = json['shop_phone'];
    shopImage = json['shop_image'];
    shopLongitude = json['shop_longitude'];
    shopLatitude = json['shop_latitude'];
    if (json['working_times'] != null) {
      workingTimes = new List<WorkingTimes>();
      json['working_times'].forEach((v) {
        workingTimes.add(new WorkingTimes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_address'] = this.shopAddress;
    data['shop_phone'] = this.shopPhone;
    data['shop_image'] = this.shopImage;
    data['shop_longitude'] = this.shopLongitude;
    data['shop_latitude'] = this.shopLatitude;
    if (this.workingTimes != null) {
      data['working_times'] = this.workingTimes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkingTimes {
  int shopId;
  String dayName;
  String openingAt;
  String closingAt;

  WorkingTimes({this.shopId, this.dayName, this.openingAt, this.closingAt});

  WorkingTimes.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    dayName = json['day_name'];
    openingAt = json['opening_at'];
    closingAt = json['closing_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['day_name'] = this.dayName;
    data['opening_at'] = this.openingAt;
    data['closing_at'] = this.closingAt;
    return data;
  }
}
