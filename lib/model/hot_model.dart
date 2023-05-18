import 'dart:convert';

Hot hotFromJson(String str) => Hot.fromJson(json.decode(str));

String hotsToJson(Hot data) => json.encode(data.toJson());

class Hot {
  List<Info>? info;
  int? responsecode;
  int? totalRows;
  String? description;

  Hot({
    this.info,
    this.responsecode,
    this.totalRows,
    this.description,
  });

  factory Hot.fromJson(Map<String, dynamic> json) => Hot(
        info: json["info"] == null
            ? []
            : List<Info>.from(json["info"]!.map((x) => Info.fromJson(x))),
        responsecode: json["responsecode"],
        totalRows: json["totalRows"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "info": info == null
            ? []
            : List<dynamic>.from(info!.map((x) => x.toJson())),
        "responsecode": responsecode,
        "totalRows": totalRows,
        "description": description,
      };
}

class Info {
  List<String>? links;
  DateTime? publicTime;
  int? contentType;
  String? createNickName;
  DateTime? createTime;
  int? isLiked;
  String? createUser;
  int? shareNo;
  String? caption;
  String? avatar;
  int? isAdv;
  int? likeNo;
  int? reportNo;
  int? createAccountId;
  int? commentNo;
  int? id;

  Info({
    this.links,
    this.publicTime,
    this.contentType,
    this.createNickName,
    this.createTime,
    this.isLiked,
    this.createUser,
    this.shareNo,
    this.caption,
    this.avatar,
    this.isAdv,
    this.likeNo,
    this.reportNo,
    this.createAccountId,
    this.commentNo,
    this.id,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        links: json["links"] == null
            ? []
            : List<String>.from(json["links"]!.map((x) => x)),
        publicTime: json["PublicTime"] == null
            ? null
            : DateTime.parse(json["PublicTime"]),
        contentType: json["ContentType"],
        createNickName: json["CreateNickName"],
        createTime: json["CreateTime"] == null
            ? null
            : DateTime.parse(json["CreateTime"]),
        isLiked: json["isLiked"],
        createUser: json["CreateUser"],
        shareNo: json["ShareNo"],
        caption: json["Caption"],
        avatar: json["Avatar"],
        isAdv: json["IsAdv"],
        likeNo: json["LikeNo"],
        reportNo: json["ReportNo"],
        createAccountId: json["CreateAccountId"],
        commentNo: json["CommentNo"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x)),
        "PublicTime": publicTime?.toIso8601String(),
        "ContentType": contentType,
        "CreateNickName": createNickName,
        "CreateTime": createTime?.toIso8601String(),
        "isLiked": isLiked,
        "CreateUser": createUser,
        "ShareNo": shareNo,
        "Caption": caption,
        "Avatar": avatar,
        "IsAdv": isAdv,
        "LikeNo": likeNo,
        "ReportNo": reportNo,
        "CreateAccountId": createAccountId,
        "CommentNo": commentNo,
        "Id": id,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
