import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserRequestEntity {
  UserRequestEntity({
    @required this.email,
    @required this.password,
  });

  String email;
  String password;

  factory UserRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class UserResponseEntity {
  UserResponseEntity({
    @required this.accessToken,
    this.channels,
    this.displayName,
  });

  String accessToken;
  List<Channel> channels;
  String displayName;

  factory UserResponseEntity.fromRawJson(String str) =>
      UserResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserResponseEntity(
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
