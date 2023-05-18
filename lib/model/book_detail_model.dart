import 'dart:convert';

BookDetail bookDetailFromJson(String str) =>
    BookDetail.fromJson(json.decode(str));

String bookDetailToJson(BookDetail data) => json.encode(data.toJson());

class BookDetail {
  List<Info>? info;
  int? responsecode;
  String? description;

  BookDetail({
    this.info,
    this.responsecode,
    this.description,
  });

  factory BookDetail.fromJson(Map<String, dynamic> json) => BookDetail(
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
  int? categoryId;
  bool? commentAllowed;
  String? authorName;
  int? followNo;
  String? bookName;
  int? rating;
  int? isLiked;
  int? isNew;
  int? adultLimit;
  int? isFollowed;
  bool? isEnable;
  String? bookThumb;
  String? bookUuid;
  int? likeNo;
  int? bookId;
  int? updateStatus;
  int? bookSexId;
  String? bookDescription;
  String? categoryName;
  String? tag;
  String? bookImage;
  int? viewNo;
  DateTime? lastUpdateTime;

  Info({
    this.categoryId,
    this.commentAllowed,
    this.authorName,
    this.followNo,
    this.bookName,
    this.rating,
    this.isLiked,
    this.isNew,
    this.adultLimit,
    this.isFollowed,
    this.isEnable,
    this.bookThumb,
    this.bookUuid,
    this.likeNo,
    this.bookId,
    this.updateStatus,
    this.bookSexId,
    this.bookDescription,
    this.categoryName,
    this.tag,
    this.bookImage,
    this.viewNo,
    this.lastUpdateTime,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        categoryId: json["CategoryId"],
        commentAllowed: json["commentAllowed"],
        authorName: json["AuthorName"],
        followNo: json["FollowNo"],
        bookName: json["BookName"],
        rating: json["Rating"],
        isLiked: json["isLiked"],
        isNew: json["isNew"],
        adultLimit: json["adultLimit"],
        isFollowed: json["isFollowed"],
        isEnable: json["isEnable"],
        bookThumb: json["BookThumb"],
        bookUuid: json["BookUUID"],
        likeNo: json["LikeNo"],
        bookId: json["BookId"],
        updateStatus: json["updateStatus"],
        bookSexId: json["bookSexId"],
        bookDescription: json["BookDescription"],
        categoryName: json["CategoryName"],
        tag: json["Tag"],
        bookImage: json["BookImage"],
        viewNo: json["ViewNo"],
        lastUpdateTime: json["lastUpdateTime"] == null
            ? null
            : DateTime.parse(json["lastUpdateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "CategoryId": categoryId,
        "commentAllowed": commentAllowed,
        "AuthorName": authorName,
        "FollowNo": followNo,
        "BookName": bookName,
        "Rating": rating,
        "isLiked": isLiked,
        "isNew": isNew,
        "adultLimit": adultLimit,
        "isFollowed": isFollowed,
        "isEnable": isEnable,
        "BookThumb": bookThumb,
        "BookUUID": bookUuid,
        "LikeNo": likeNo,
        "BookId": bookId,
        "updateStatus": updateStatus,
        "bookSexId": bookSexId,
        "BookDescription": bookDescription,
        "CategoryName": categoryName,
        "Tag": tag,
        "BookImage": bookImage,
        "ViewNo": viewNo,
        "lastUpdateTime": lastUpdateTime?.toIso8601String(),
      };
}
