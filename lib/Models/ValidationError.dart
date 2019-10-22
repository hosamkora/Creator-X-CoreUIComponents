// To parse this JSON data, do
//
//     final validationError = validationErrorFromJson(jsonString);

import 'dart:convert';

ValidationError validationErrorFromJson(String str) =>
    ValidationError.fromJson(json.decode(str));

String validationErrorToJson(ValidationError data) =>
    json.encode(data.toJson());

class ValidationError {
  List<String> name;
  List<String> phone;
  List<String> password;
  List<String> age;

  ValidationError({
    this.name,
    this.phone,
    this.password,
    this.age,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      ValidationError(
        name: json["name"] == null
            ? null
            : List<String>.from(json["name"].map((x) => x)),
        phone: json["phone"] == null
            ? null
            : List<String>.from(json["phone"].map((x) => x)),
        password: json["password"] == null
            ? null
            : List<String>.from(json["password"].map((x) => x)),
        age: json["age"] == null
            ? null
            : List<String>.from(json["age"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : List<dynamic>.from(name.map((x) => x)),
        "phone": phone == null ? null : List<dynamic>.from(phone.map((x) => x)),
        "password": password == null
            ? null
            : List<dynamic>.from(password.map((x) => x)),
        "age": age == null ? null : List<dynamic>.from(age.map((x) => x)),
      };
}
