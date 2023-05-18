import 'dart:convert';

ExploreBooks booksFromJson(String str) =>
    ExploreBooks.fromJson(json.decode(str));

String booksToJson(ExploreBooks data) => json.encode(data.toJson());

class ExploreBooks {
  List<Info>? info;
  int? responsecode;
  String? description;

  ExploreBooks({
    this.info,
    this.responsecode,
    this.description,
  });

  factory ExploreBooks.fromJson(Map<String, dynamic> json) => ExploreBooks(
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
  int? numberOfChapter;
  String? bookName;
  int? rating;
  int? authorAccountId;
  String? bookThumb;
  String? imgUrl;
  String? bookUuid;
  String? categoryList;
  int? bookId;
  int? updateStatus;
  String? authorNick;
  int? totalLikeNo;
  int? viewNo;

  Info({
    this.numberOfChapter,
    this.bookName,
    this.rating,
    this.authorAccountId,
    this.bookThumb,
    this.imgUrl,
    this.bookUuid,
    this.categoryList,
    this.bookId,
    this.updateStatus,
    this.authorNick,
    this.totalLikeNo,
    this.viewNo,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        numberOfChapter: json["NumberOfChapter"],
        bookName: json["BookName"],
        rating: json["Rating"],
        authorAccountId: json["authorAccountId"],
        bookThumb: json["BookThumb"],
        imgUrl: json["imgUrl"],
        bookUuid: json["BookUUID"],
        categoryList: json["CategoryList"],
        bookId: json["BookId"],
        updateStatus: json["updateStatus"],
        authorNick: json["AuthorNick"] ?? json["AuthorName"],
        totalLikeNo: json["TotalLikeNo"] ?? json["LikeNo"],
        viewNo: json["ViewNo"],
      );

  Map<String, dynamic> toJson() => {
        "NumberOfChapter": numberOfChapter,
        "BookName": bookName,
        "Rating": rating,
        "authorAccountId": authorAccountId,
        "BookThumb": bookThumb,
        "imgUrl": imgUrl,
        "BookUUID": bookUuid,
        "CategoryList": categoryList,
        "BookId": bookId,
        "updateStatus": updateStatus,
        "AuthorNick": authorNick,
        "TotalLikeNo": totalLikeNo,
        "ViewNo": viewNo,
      };
}
