import 'package:flutter/material.dart';

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
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: book!.info!.length,
      itemBuilder: (context, index) {
        int dataIndex = book!.info![index].data!.length;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 14),
              child: Text(
                book!.info![index].title!,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < dataIndex; i++)
                    '${book!.info![index].title}' == "Bảng xếp hạng"
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          book!.info![index].data![i].title!,
                                          style: const TextStyle(
                                            color: Color(0xFFEE7938),
                                            fontSize: 15,
                                          ),
                                        ),
                                        for(int j =0; j<=4; j++)
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.2,
                                            child: Image.network(book!.info![index]
                                                .data![i].data![j].imgUrl!))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Image.network(
                                        book!.info![index].data![i].imgUrl!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8),
                                    child: Text(
                                      book!.info![index].data![i].bookName!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  // Text(
                                  //   book!.info![index].data![i].categoryList!,
                                  // ),
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
