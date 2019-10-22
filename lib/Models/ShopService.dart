// To parse this JSON data, do
//
//     final shopService = shopServiceFromJson(jsonString);

import 'dart:convert';

List<ShopService> shopServiceFromJson(String str) => List<ShopService>.from(json.decode(str).map((x) => ShopService.fromJson(x)));

String shopServiceToJson(List<ShopService> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopService {
    int shopId;
    int serviceId;
    String serviceName;
    String serviceDescription;
    String serviceCost;
    int estimatedDuration;

    ShopService({
        this.shopId,
        this.serviceId,
        this.serviceName,
        this.serviceDescription,
        this.serviceCost,
        this.estimatedDuration,
    });

    factory ShopService.fromJson(Map<String, dynamic> json) => ShopService(
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        serviceId: json["service_id"] == null ? null : json["service_id"],
        serviceName: json["service_name"] == null ? null : json["service_name"],
        serviceDescription: json["service_description"] == null ? null : json["service_description"],
        serviceCost: json["service_cost"] == null ? null : json["service_cost"],
        estimatedDuration: json["estimated_duration"] == null ? null : json["estimated_duration"],
    );

    Map<String, dynamic> toJson() => {
        "shop_id": shopId == null ? null : shopId,
        "service_id": serviceId == null ? null : serviceId,
        "service_name": serviceName == null ? null : serviceName,
        "service_description": serviceDescription == null ? null : serviceDescription,
        "service_cost": serviceCost == null ? null : serviceCost,
        "estimated_duration": estimatedDuration == null ? null : estimatedDuration,
    };
}
