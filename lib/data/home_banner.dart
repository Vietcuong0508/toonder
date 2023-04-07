class BookBanner {
  int bookID;
  String bookUUID;
  int bannerType;
  String imgUrl;
  int eventID;

  BookBanner(
      {required this.bookID,
      required this.bookUUID,
      required this.bannerType,
      required this.imgUrl,
      required this.eventID});

  factory BookBanner.fromJson(Map<String, dynamic> json) {
    return BookBanner(
      bookID: json['BookID'],
      bookUUID: json['BookUUID'],
      bannerType: json['BannerType'],
      imgUrl: json['imgUrl'],
      eventID: json['EventID'],
    );
  }
}
