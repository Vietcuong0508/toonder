import 'package:flutter/material.dart';
import 'package:toonder_app/screen/Home/home_chart.dart';

import '../../data/book.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({
    super.key,
    required this.book,
  });

  final Books? book;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: book!.info!.length,
      itemBuilder: (context, index) {
        int dataIndex = book!.info![index].data!.length;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                bottom: 14,
              ),
              child: Text(
                book!.info![index].title!,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < dataIndex; i++)
                    '${book!.info![index].title}' == "Bảng xếp hạng"
                        ? Chart(book: book, i: i)
                        : Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Image.network(
                                        book!.info![index].data![i].imgUrl!,
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.22,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      child: Text(
                                        book!.info![index].data![i].bookName!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(
                                        0xFF373753,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 8, right: 5, bottom: 8),
                                      child: Text(
                                        book!.info![index].data![i]
                                            .categoryName!,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 28,
                                  )
                                ],
                              ),
                            ),
                          ),
                ],
              ),
            ),
          
          ],
        );
      },
    );
  }
}
