

import 'dart:convert';

LoginResData loginResDataFromJson(String str) => LoginResData.fromJson(json.decode(str));

String loginResDataToJson(LoginResData data) => json.encode(data.toJson());

class LoginResData {
    String? emailorphonenumber;
    String? firstName;
    String? lastName;
    String? id;
    String? password;
    num? v;

    LoginResData({
        this.emailorphonenumber,
        this.firstName,
        this.lastName,
        this.id,
        this.password,
        this.v,
    });

    factory LoginResData.fromJson(Map<String, dynamic> json) => LoginResData(
        emailorphonenumber: json["emailorphonenumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        id: json["_id"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "emailorphonenumber": emailorphonenumber,
        "firstName": firstName,
        "lastName": lastName,
        "_id": id,
        "password": password,
        "__v": v,
    };
}
