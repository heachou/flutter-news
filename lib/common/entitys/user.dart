import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserLoginRequestEntity {
  UserLoginRequestEntity({
    @required this.email,
    @required this.password,
  });

  String email;
  String password;

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class UserLoginResponseEntity {
  UserLoginResponseEntity({
    @required this.accessToken,
    this.channels,
    this.displayName,
  });

  String accessToken;
  List<Channel> channels;
  String displayName;

  factory UserLoginResponseEntity.fromRawJson(String str) =>
      UserLoginResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        accessToken: json["access_token"],
        channels: List<Channel>.from(
            json["channels"].map((x) => channelValues.map[x])),
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "channels":
            List<dynamic>.from(channels.map((x) => channelValues.reverse[x])),
        "display_name": displayName,
      };
}

enum Channel { FOX, NBA, SPORT, GAME, NEWS }

final channelValues = EnumValues({
  "FOX": Channel.FOX,
  "GAME": Channel.GAME,
  "NBA": Channel.NBA,
  "NEWS": Channel.NEWS,
  "SPORT": Channel.SPORT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
