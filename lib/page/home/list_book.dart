import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:toonder_app/bloc/book/book_bloc.dart';
import 'package:toonder_app/model/book_model.dart';
import 'package:toonder_app/page/detail_book/detail_book.dart';
import 'package:toonder_app/src/constants/global_color.dart';

class ListBook extends StatefulWidget {
  const ListBook({super.key});

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  final BookBloc _book = BookBloc();
  Books books = Books();
  List<Book> lstData = [];
  List<Charts> lstBook = [];

  @override
  void initState() {
    super.initState();
    _book.add(GetBookList());
  }

  @override
  Widget build(BuildContext context) {
    return _buildListBook();
  }

  Widget _buildListBook() {
    return BlocProvider(
      create: (_) => _book,
      child: BlocListener<BookBloc, BookState>(
        listener: (context, state) {
          if (state is BookError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
          if (state is BookLoaded) {
            books = state.book;
            lstData = books.info![1].data!;
            lstBook = books.info![1].data![0].data!;
          }
        },
        child: BlocBuilder<BookBloc, BookState>(builder: (context, state) {
          if (state is BookInitial) {
            return _bookLoading();
          } else if (state is BookLoading) {
            return _bookLoading();
          } else if (state is BookLoaded) {
            Books listBook = state.book;
            lstData = books.info![1].data!;
            lstBook = books.info![1].data![0].data!;
            return _listBook(context, listBook, lstData, lstBook);
          } else if (state is BookError) {
            return Container();
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  Widget _bookLoading() =>
      Center(child: Image.asset('assets/images/logo_footer.png'));

  Widget _listBook(BuildContext context, books, lstData, lstBook) {
    var width = MediaQuery.of(context).size.width / 375;
    var height = MediaQuery.of(context).size.height / 812;
    return books.info == null
        ? Image.asset('assets/images/logo_footer.png')
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 15),
            itemCount: books.info!.length,
            itemBuilder: (context, index) {
              int dataIndex = books.info![index].data!.length;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      bottom: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          books.info![index].title!,
                          style: TextStyle(
                              fontSize: height * 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Tất cả >',
                          style: TextStyle(
                              color: const Color(0xffEE7938),
                              fontSize: height * 15),
                        )
                      ],
                    ),
                  ),
                  '${books.info![index].title}' == "Bảng xếp hạng"
                      ? bookChart(context, lstData, lstBook)
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < dataIndex; i++)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: InkWell(
                                      onTap: () {
                                        // print(model.info![index].bookId);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailBook(
                                                      book_id: books
                                                          .info![index]
                                                          .data![i]
                                                          .bookId!,
                                                      account_id: 50336,
                                                      book_uuid: books
                                                          .info![index]
                                                          .data![i]
                                                          .bookUuid,
                                                    )));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                width * 10),
                                            child: Image.network(
                                              books.info![index].data![i]
                                                  .imgUrl!,
                                              fit: BoxFit.cover,
                                              height: height * 155,
                                              width: width * 110,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, bottom: 8),
                                              child: Text(
                                                books.info![index].data![i]
                                                    .bookName!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: height * 13),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: const Color(
                                                0xFF373753,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: height * 5,
                                                  top: height * 8,
                                                  right: height * 5,
                                                  bottom: height * 8),
                                              child: Text(
                                                books.info![index].data![i]
                                                    .categoryName!,
                                                style: TextStyle(
                                                    fontSize: height * 10),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 28,
                                          )
                                        ],
                                      ),
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

  Widget bookChart(BuildContext context, lstData, lstBook) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 1,
          height: height * 0.61,
          child: PageView.builder(
            itemCount: lstData.length,
            controller: PageController(viewportFraction: 0.9),
            padEnds: false,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lstData[index].title,
                    style: TextStyle(
                      color: const Color(0xFFEE7938),
                      fontSize: width * 0.04,
                    ),
                  ),
                  for (int j = 0; j < lstData[index].data.length; j++)
                    InkWell(
                      onTap: () {
                        // print(model.info![index].bookId);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailBook(
                                      book_id: lstData[index].data[j].bookId,
                                      account_id: 50336,
                                      book_uuid:
                                          lstData[index].data[j].bookUuid,
                                    )));
                      },
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  lstData[index].data[j].imgUrl,
                                  width: width * 0.191,
                                  height: width * 0.191,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.18,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 2, right: 16),
                                child: Text(
                                  (j + 1).toString(),
                                  style: TextStyle(fontSize: width * 0.045),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: width * 0.18,
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lstData[index].data[j].bookName!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                  // ignore: unnecessary_string_interpolations
                                  '${lstData[index].title!}' == 'Top View'
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    gradient: GlobalColors
                                                        .categoryBgGradient),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6,
                                                          top: 6,
                                                          right: 6,
                                                          bottom: 4),
                                                  child: Text(
                                                    lstData[index]
                                                        .data[j]
                                                        .categoryList!,
                                                    style: TextStyle(
                                                        fontSize:
                                                            width * 0.026),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 6),
                                                child: Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  size: width * 0.04,
                                                ),
                                              ),
                                              Text(
                                                NumberFormat.decimalPattern()
                                                    .format(
                                                      lstData[index]
                                                          .data[j]
                                                          .viewNo!,
                                                    )
                                                    .replaceAll(',', '.'),
                                                style: TextStyle(
                                                    fontSize: width * 0.04),
                                              )
                                            ],
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6,
                                                          top: 6,
                                                          right: 6,
                                                          bottom: 4),
                                                  child: Text(
                                                    lstData[index]
                                                        .data[j]
                                                        .categoryList!,
                                                    style: TextStyle(
                                                        fontSize:
                                                            width * 0.026),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 6),
                                                child: Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  size: width * 0.04,
                                                ),
                                              ),
                                              Text(
                                                lstData[index]
                                                    .data[j]
                                                    .totalLikeNo!
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: width * 0.04),
                                              )
                                            ],
                                          ),
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
          ),
        )
      ],
    );
  }
}
