import 'package:flutter/material.dart';
import 'package:toonder_app/src/constants/global_color.dart';

import '../../model/book_detail_model.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
    required this.width,
    required this.info,
  });

  final double width;
  final Info info;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: width * 30, left: width * 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Tóm tắt truyện',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: width * 15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: width * 5),
              child: Text(
                info.bookDescription!,
                style: TextStyle(
                    fontSize: width * 15, color: Colors.grey.shade400),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Container(
                  height: width * 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: GlobalColors.categoryBgGradient),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Text(
                        info.categoryName!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 10,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 30),
                  child: const Text("chuong moi"),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: width * 20),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Tìm hiểu thêm >>',
                  style: TextStyle(
                      color: Colors.orange.shade900,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: width * 10, top: width * 10, bottom: width * 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(width * 10),
                    splashColor: Colors.white.withOpacity(0.8),
                    highlightColor: Colors.white.withOpacity(0.5),
                    child: Container(
                      width: width * 115,
                      height: width * 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFF27273F).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(width * 10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 15, vertical: width * 5),
                        child: info.isLiked == -1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(Icons.favorite),
                                  Text('Thích'),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.favorite,
                                    color: Color(0xFFFC5A15),
                                  ),
                                  Text(
                                    'Thích',
                                    style: TextStyle(color: Color(0xFFFC5A15)),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(width * 10),
                    splashColor: Colors.white.withOpacity(0.8),
                    highlightColor: Colors.white.withOpacity(0.5),
                    child: Container(
                      width: width * 115,
                      height: width * 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFF27273F).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(width * 10)),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 15, vertical: width * 5),
                          child: info.isFollowed == -1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(Icons.bookmark),
                                    Text('Theo dõi'),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(
                                      Icons.bookmark,
                                      color: Color(0xFFFC5A15),
                                    ),
                                    Text(
                                      'Theo dõi',
                                      style:
                                          TextStyle(color: Color(0xFFFC5A15)),
                                    ),
                                  ],
                                )),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(width * 10),
                    splashColor: Colors.white.withOpacity(0.8),
                    highlightColor: Colors.white.withOpacity(0.5),
                    child: Container(
                      width: width * 115,
                      height: width * 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFF27273F).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(width * 10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 15, vertical: width * 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.comment_outlined),
                            Text('Bình luận'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
