import 'package:flutter/material.dart';
import 'package:toonder_app/data/book.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.book,
    required this.i,
  });

  final Books? book;
  final int i;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book!.info![1].data![i].title!,
                      style: const TextStyle(
                        color: Color(0xFFEE7938),
                        fontSize: 15,
                      ),
                    ),
                    for (int j = 0; j <= 4; j++)
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13, bottom: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  book!.info![1].data![i].data![j].imgUrl!,
                                  width: MediaQuery.of(context).size.width * 0.18,
                                  height:
                                      MediaQuery.of(context).size.width * 0.18,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.18,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 2, right: 16),
                                child: Text(
                                  (j + 1).toString(),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.17,
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book!.info![1].data![i].data![j].bookName!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  // ignore: unnecessary_string_interpolations
                                  '${book!.info![1].data![i].title!}' ==
                                          'Top View'
                                      ? Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: const Color(
                                                    0xFF373753,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 6,
                                                      top: 6,
                                                      right: 6,
                                                      bottom: 4),
                                                  child: Text(
                                                    book!.info![1].data![i]
                                                        .data![j].categoryList!,
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 6),
                                                child: Icon(Icons
                                                    .remove_red_eye_outlined),
                                              ),
                                              Text(book!.info![1].data![i]
                                                  .data![j].viewNo!
                                                  .toString())
                                            ],
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: const Color(
                                                    0xFF373753,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 6,
                                                      top: 6,
                                                      right: 6,
                                                      bottom: 4),
                                                  child: Text(
                                                    book!.info![1].data![i]
                                                        .data![j].categoryList!,
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 6),
                                                child: Icon(Icons
                                                    .favorite_border_outlined),
                                              ),
                                              Text(book!.info![1].data![i]
                                                  .data![j].totalLikeNo!
                                                  .toString())
                                            ],
                                          ),
                                        )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
