import 'dart:convert';

Chapter chapterFromJson(String str) => Chapter.fromJson(json.decode(str));

String chapterToJson(Chapter data) => json.encode(data.toJson());

class Chapter {
  List<InfoChapter>? info;
  int? responsecode;
  String? description;

  Chapter({
    this.info,
    this.responsecode,
    this.description,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        info: json["info"] == null
            ? []
            : List<InfoChapter>.from(
                json["info"]!.map((x) => InfoChapter.fromJson(x))),
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

class InfoChapter {
  String? chapterName;
  DateTime? publishDate;
  int? isUnLock;
  int? sortOrder;
  int? unlockByCoin;
  int? adultLimit;
  int? unlockByAd;
  int? likeNo;
  int? bookId;
  int? commentNo;
  String? chapterId;
  int? unlockByPoint;
  int? isPremium;
  int? viewNo;
  String? chapterImg;
  DateTime? lastUpdateTime;

  InfoChapter({
    this.chapterName,
    this.publishDate,
    this.isUnLock,
    this.sortOrder,
    this.unlockByCoin,
    this.adultLimit,
    this.unlockByAd,
    this.likeNo,
    this.bookId,
    this.commentNo,
    this.chapterId,
    this.unlockByPoint,
    this.isPremium,
    this.viewNo,
    this.chapterImg,
    this.lastUpdateTime,
  });

  factory InfoChapter.fromJson(Map<String, dynamic> json) => InfoChapter(
        chapterName: json["ChapterName"],
        publishDate: json["PublishDate"] == null
            ? null
            : DateTime.parse(json["PublishDate"]),
        isUnLock: json["isUnLock"],
        sortOrder: json["SortOrder"],
        unlockByCoin: json["UnlockByCoin"],
        adultLimit: json["adultLimit"],
        unlockByAd: json["UnlockByAd"],
        likeNo: json["LikeNo"],
        bookId: json["BookId"],
        commentNo: json["CommentNo"],
        chapterId: json["ChapterId"],
        unlockByPoint: json["UnlockByPoint"],
        isPremium: json["isPremium"],
        viewNo: json["ViewNo"],
        chapterImg: json["ChapterImg"],
        lastUpdateTime: json["lastUpdateTime"] == null
            ? null
            : DateTime.parse(json["lastUpdateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "ChapterName": chapterName,
        "PublishDate": publishDate?.toIso8601String(),
        "isUnLock": isUnLock,
        "SortOrder": sortOrder,
        "UnlockByCoin": unlockByCoin,
        "adultLimit": adultLimit,
        "UnlockByAd": unlockByAd,
        "LikeNo": likeNo,
        "BookId": bookId,
        "CommentNo": commentNo,
        "ChapterId": chapterId,
        "UnlockByPoint": unlockByPoint,
        "isPremium": isPremium,
        "ViewNo": viewNo,
        "ChapterImg": chapterImg,
        "lastUpdateTime": lastUpdateTime?.toIso8601String(),
      };
}
