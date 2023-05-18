import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  List<Info>? info;
  int? responsecode;
  String? description;

  Category({
    this.info,
    this.responsecode,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
  String? categoryName;
  String? iconLink;
  String? categoryDescription;

  Info({
    this.categoryId,
    this.categoryName,
    this.iconLink,
    this.categoryDescription,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        iconLink: json["IconLink"],
        categoryDescription: json["CategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "IconLink": iconLink,
        "CategoryDescription": categoryDescription,
      };
}
