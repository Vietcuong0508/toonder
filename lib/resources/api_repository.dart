import 'package:dio/dio.dart';
import 'package:toonder_app/model/banner_model.dart';
import 'package:toonder_app/model/book_detail_model.dart';
import 'package:toonder_app/model/book_model.dart';
import 'package:toonder_app/model/category_model.dart';
import 'package:toonder_app/model/chapter_model.dart';
import 'package:toonder_app/model/explore_model.dart';
import 'package:toonder_app/model/hot_model.dart';
import 'package:toonder_app/page/detail_book/detail_book.dart';
import 'package:toonder_app/resources/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();
  Future<BookBanner> fetchBannerList() async {
    final Response result = await _provider.get("getbanner");
    // ignore: unnecessary_null_comparison
    if (result == null) {
      throw Exception("error");
    }
    return BookBanner.fromJson(result.data);
  }

  Future<Books> fetchBookList() async {
    final Response result = await _provider.get("mainhome?account_id=50231");
    // ignore: unnecessary_null_comparison
    if (result == null) {
      throw Exception("error");
    }
    return Books.fromJson(result.data);
  }

  Future<Category> fetchCategory() async {
    final Response result = await _provider.get("getlistcategory");
    // ignore: unnecessary_null_comparison
    if (result == null) {
      throw Exception("error");
    }
    return Category.fromJson(result.data);
  }

  Future<Hot> fetchHot() async {
    final Response result = await _provider
        .getHot("get_hot_topic?account_id=50336&page=1&page_size=15");
    // ignore: unnecessary_null_comparison
    if (result == null) {
      throw Exception("error");
    }
    return Hot.fromJson(result.data);
  }

  Future<ExploreBooks> fetchRankBook(int type_rank, int order_type) async {
    Map<String, dynamic> args = {};
    args["type_rank"] = type_rank;
    args["order_type"] = order_type;
    final Response result = await _provider.post("ranking", args);
    if (result.statusCode != 200) {
      throw Exception("Error");
    } else {
      return ExploreBooks.fromJson(result.data);
    }
  }

  Future<ExploreBooks> fetchCategoryBook(
      int category_id, int order_type) async {
    Map<String, dynamic> args = {};
    args["category_id"] = category_id;
    args["order_type"] = order_type;
    final Response result = await _provider.post("getbookbycategory", args);
    if (result.statusCode != 200) {
      throw Exception("Error");
    } else {
      return ExploreBooks.fromJson(result.data);
    }
  }

  Future<ExploreBooks> fetchReleaseScheduleBook(
      int week_day, int order_type) async {
    Map<String, dynamic> args = {};
    args["week_day"] = week_day;
    args["order_type"] = order_type;
    final Response result = await _provider.post("getpublishdate", args);
    if (result.statusCode != 200) {
      throw Exception("Error");
    } else {
      return ExploreBooks.fromJson(result.data);
    }
  }

  Future<BookDetail> fetchBookDetail(int book_id, int account_id) async {
    Map<String, dynamic> args = {};
    args["book_id"] = book_id;
    args["account_id"] = account_id;
    final Response result = await _provider.post("getdetailbookbyid", args);
    if (result.statusCode != 200) {
      throw Exception("Error");
    } else {
      return BookDetail.fromJson(result.data);
    }
  }

  Future<Chapter> fetchChapter(String book_uuid, int account_id) async {
    Map<String, dynamic> args = {};
    args["book_uuid"] = book_uuid;
    args["account_id"] = account_id;
    final Response result = await _provider.post("getchapterbybookuuid", args);
    if (result.statusCode != 200) {
      throw Exception("Error");
    } else {
      return Chapter.fromJson(result.data);
    }
  }
}

class NetworkError extends Error {}
