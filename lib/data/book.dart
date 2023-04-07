class Books {
  int numberOfChapter;
  String authorName;
  String bookName;
  int rating;
  int authorAccountId;
  int bookSexId;
  String bookThumb;
  String imgUrl;
  String bookUUID;
  int likeNo;
  String categoryList;
  int bookId;
  int updateStatus;
  int viewNo;
  String lastUpdateTime;

  Books(
      {required this.numberOfChapter,
      required this.authorName,
      required this.bookName,
      required this.rating,
      required this.authorAccountId,
      required this.bookSexId,
      required this.bookThumb,
      required this.imgUrl,
      required this.bookUUID,
      required this.likeNo,
      required this.categoryList,
      required this.bookId,
      required this.updateStatus,
      required this.viewNo,
      required this.lastUpdateTime});

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      numberOfChapter: json['NumberOfChapter'],
      authorName: json['AuthorName'],
      bookName: json['BookName'],
      rating: json['Rating'],
      authorAccountId: json['authorAccountId'],
      bookSexId: json['BookSexId'],
      bookThumb: json['BookThumb'],
      imgUrl: json['imgUrl'],
      bookUUID: json['BookUUID'],
      likeNo: json['LikeNo'],
      categoryList: json['CategoryList'],
      bookId: json['BookId'],
      updateStatus: json['updateStatus'],
      viewNo: json['ViewNo'],
      lastUpdateTime: json['lastUpdateTime'],
    );
  }
}

class Info {
  List<Books> data;
  String title;

  Info({required this.data, required this.title});


  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      data: json['data'],
      title: json['title'],
    );
  }
}

// class Datum {
//     int? numberOfChapter;
//     String? authorName;
//     String? bookName;
//     int? rating;
//     int? authorAccountId;
//     int? bookSexId;
//     String? bookThumb;
//     String? imgUrl;
//     String? bookUUID;
//     int? likeNo;
//     String? categoryList;
//     int? bookId;
//     int? updateStatus;
//     int? viewNo;
//     String? lastUpdateTime;

//     Datum({this.numberOfChapter, this.authorName, this.bookName, this.rating, this.authorAccountId, this.bookSexId, this.bookThumb, this.imgUrl, this.bookUUID, this.likeNo, this.categoryList, this.bookId, this.updateStatus, this.viewNo, this.lastUpdateTime}); 

//     Datum.fromJson(Map<String, dynamic> json) {
//         numberOfChapter = json['NumberOfChapter'];
//         authorName = json['AuthorName'];
//         bookName = json['BookName'];
//         rating = json['Rating'];
//         authorAccountId = json['authorAccountId'];
//         bookSexId = json['BookSexId'];
//         bookThumb = json['BookThumb'];
//         imgUrl = json['imgUrl'];
//         bookUUID = json['BookUUID'];
//         likeNo = json['LikeNo'];
//         categoryList = json['CategoryList'];
//         bookId = json['BookId'];
//         updateStatus = json['updateStatus'];
//         viewNo = json['ViewNo'];
//         lastUpdateTime = json['lastUpdateTime'];
//     }

//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = Map<String, dynamic>();
//         data['NumberOfChapter'] = numberOfChapter;
//         data['AuthorName'] = authorName;
//         data['BookName'] = bookName;
//         data['Rating'] = rating;
//         data['authorAccountId'] = authorAccountId;
//         data['BookSexId'] = bookSexId;
//         data['BookThumb'] = bookThumb;
//         data['imgUrl'] = imgUrl;
//         data['BookUUID'] = bookUUID;
//         data['LikeNo'] = likeNo;
//         data['CategoryList'] = categoryList;
//         data['BookId'] = bookId;
//         data['updateStatus'] = updateStatus;
//         data['ViewNo'] = viewNo;
//         data['lastUpdateTime'] = lastUpdateTime;
//         return data;
//     }
// }

// class Info {
//     List<Datum?>? data;
//     String? title;

//     Info({this.data, this.title}); 

//     Info.fromJson(Map<String, dynamic> json) {
//         if (json['data'] != null) {
//          data = <Datum>[];
//          json['data'].forEach((v) {
//          data!.add(Datum.fromJson(v));
//         });
//       }
//         title = json['title'];
//     }

//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = Map<String, dynamic>();
//         data['data'] =data != null ? data!.map((v) => v?.toJson()).toList() : null;
//         data['title'] = title;
//         return data;
//     }
// }

// class Root {
//     List<Info?>? info;

//     Root({this.info}); 

//     Root.fromJson(Map<String, dynamic> json) {
//         if (json['info'] != null) {
//          info = <Info>[];
//          json['info'].forEach((v) {
//          info!.add(Info.fromJson(v));
//         });
//       }
//     }

//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = Map<String, dynamic>();
//         data['info'] =info != null ? info!.map((v) => v?.toJson()).toList() : null;
//         return data;
//     }
// }