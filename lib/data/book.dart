// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
    Books({
        this.info,
        this.description,
        this.responsecode,
    });

    List<Info>? info;
    String? description;
    int? responsecode;

    factory Books.fromJson(Map<String, dynamic> json) => Books(
        info: json["info"] == null ? [] : List<Info>.from(json["info"]!.map((x) => Info.fromJson(x))),
        description: json["description"],
        responsecode: json["responsecode"],
    );

    Map<String, dynamic> toJson() => {
        "info": info == null ? [] : List<dynamic>.from(info!.map((x) => x.toJson())),
        "description": description,
        "responsecode": responsecode,
    };
}

class Info {
    Info({
        this.data,
        this.title,
    });

    List<InfoDatum>? data;
    String? title;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        data: json["data"] == null ? [] : List<InfoDatum>.from(json["data"]!.map((x) => InfoDatum.fromJson(x))),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "title": title,
    };
}

class InfoDatum {
    InfoDatum({
        this.numberOfChapter,
        this.authorName,
        this.bookName,
        this.rating,
        this.authorAccountId,
        this.bookSexId,
        this.bookThumb,
        this.imgUrl,
        this.bookUuid,
        this.likeNo,
        this.totalLikeNo,
        this.categoryList,
        this.categoryName,
        this.bookId,
        this.updateStatus,
        this.viewNo,
        this.lastUpdateTime,
        this.data,
        this.title,
    });

    int? numberOfChapter;
    String? authorName;
    String? bookName;
    int? rating;
    int? authorAccountId;
    int? bookSexId;
    String? bookThumb;
    String? imgUrl;
    String? bookUuid;
    int? likeNo;
    int? totalLikeNo;
    String? categoryList;
    String? categoryName;
    int? bookId;
    int? updateStatus;
    int? viewNo;
    DateTime? lastUpdateTime;
    List<Charts>? data;
    String? title;

    factory InfoDatum.fromJson(Map<String, dynamic> json) => InfoDatum(
        numberOfChapter: json["NumberOfChapter"],
        authorName: json["AuthorName"],
        bookName: json["BookName"],
        rating: json["Rating"],
        authorAccountId: json["authorAccountId"],
        bookSexId: json["BookSexId"],
        bookThumb: json["BookThumb"],
        imgUrl: json["imgUrl"],
        bookUuid: json["BookUUID"],
        categoryName: json["CategoryName"] ?? json["CategoryList"],
        likeNo: json["LikeNo"],
        totalLikeNo: json["TotalLikeNo"],
        bookId: json["BookId"],
        updateStatus: json["updateStatus"],
        viewNo: json["ViewNo"],
        lastUpdateTime: json["lastUpdateTime"] == null ? null : DateTime.parse(json["lastUpdateTime"]),
        data: json["data"] == null ? [] : List<Charts>.from(json["data"]!.map((x) => Charts.fromJson(x))),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "NumberOfChapter": numberOfChapter,
        "AuthorName": authorName,
        "BookName": bookName,
        "Rating": rating,
        "authorAccountId": authorAccountId,
        "BookSexId": bookSexId,
        "BookThumb": bookThumb,
        "imgUrl": imgUrl,
        "BookUUID": bookUuid,
        "LikeNo": likeNo,
        "CategoryList": categoryList,
        "CategoryName": categoryName,
        "BookId": bookId,
        "updateStatus": updateStatus,
        "ViewNo": viewNo,
        "lastUpdateTime": lastUpdateTime?.toIso8601String(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "title": title,
    };
}

class Charts {
    Charts({
        this.totalNo,
        this.numberOfChapter,
        this.bookName,
        this.rating,
        this.bookThumb,
        this.imgUrl,
        this.bookUuid,
        this.categoryList,
        this.bookId,
        this.updateStatus,
        this.authorNick,
        this.viewNo,
        this.totalLikeNo,
        this.authorAccountId,
        this.likeNo,
    });

    int? totalNo;
    int? numberOfChapter;
    String? bookName;
    int? rating;
    String? bookThumb;
    String? imgUrl;
    String? bookUuid;
    String? categoryList;
    int? bookId;
    int? updateStatus;
    String? authorNick;
    int? viewNo;
    int? totalLikeNo;
    int? authorAccountId;
    int? likeNo;

    factory Charts.fromJson(Map<String, dynamic> json) => Charts(
        totalNo: json["TotalNo"],
        numberOfChapter: json["NumberOfChapter"],
        bookName: json["BookName"],
        rating: json["Rating"],
        bookThumb: json["BookThumb"],
        imgUrl: json["imgUrl"],
        bookUuid: json["BookUUID"],
        categoryList: json["CategoryList"],
        bookId: json["BookId"],
        updateStatus: json["updateStatus"],
        authorNick: json["AuthorNick"],
        viewNo: json["ViewNo"],
        totalLikeNo: json["TotalLikeNo"],
        authorAccountId: json["authorAccountId"],
        likeNo: json["LikeNo"],
    );

    Map<String, dynamic> toJson() => {
        "TotalNo": totalNo,
        "NumberOfChapter": numberOfChapter,
        "BookName": bookName,
        "Rating": rating,
        "BookThumb": bookThumb,
        "imgUrl": imgUrl,
        "BookUUID": bookUuid,
        "CategoryList": categoryList,
        "BookId": bookId,
        "updateStatus": updateStatus,
        "AuthorNick": authorNick,
        "ViewNo": viewNo,
        "TotalLikeNo": totalLikeNo,
        "authorAccountId": authorAccountId,
        "LikeNo": likeNo,
    };
}