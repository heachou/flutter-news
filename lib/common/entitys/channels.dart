class ChannelResponseEntity {
  ChannelResponseEntity({
    this.code,
    this.title,
  });

  String code;
  String title;

  factory ChannelResponseEntity.fromJson(Map<String, dynamic> json) =>
      ChannelResponseEntity(
        code: json["code"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
      };
}
