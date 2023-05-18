import 'dart:convert';

BookBanner booksFromJson(String str) => BookBanner.fromJson(json.decode(str));

String booksToJson(BookBanner data) => json.encode(data.toJson());

class BookBanner {
  BookBanner({
    this.info,
    this.responsecode,
    this.description,
  });

  List<Info>? info;
  int? responsecode;
  String? description;

  BookBanner.withDes(String des) {
    description = des;
  }

  factory BookBanner.fromJson(Map<String, dynamic> json) => BookBanner(
        info: json["info"] == null
            ? []
            : List<Info>.from(json["info"]!.map((x) => Info.fromJson(x))),
        responsecode: json["responsecode"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "info": info == null
            ? []
            : List<dynamic>.from(info!.map((x) => x.toJson())),
        "responsecode": responsecode,
        "description": description,
      };
}

class Info {
  Info({
    this.imgUrl,
    this.bookUuid,
    this.bookId,
    this.bannerType,
    this.eventId,
  });

  String? imgUrl;
  String? bookUuid;
  int? bookId;
  int? bannerType;
  int? eventId;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        imgUrl: json["imgUrl"],
        bookUuid: json["BookUUID"],
        bookId: json["BookID"],
        bannerType: json["BannerType"],
        eventId: json["EventID"],
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "BookUUID": bookUuid,
        "BookID": bookId,
        "BannerType": bannerType,
        "EventID": eventId,
      };
}
