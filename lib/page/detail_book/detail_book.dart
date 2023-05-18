import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:toonder_app/bloc/book_detail/book_detail_bloc.dart';
import 'package:toonder_app/bloc/chapter/chapter_bloc.dart';
import 'package:toonder_app/model/book_detail_model.dart';
import 'package:toonder_app/model/chapter_model.dart';
import 'package:toonder_app/page/detail_book/book_info.dart';
import 'package:toonder_app/src/constants/global_color.dart';

// ignore: must_be_immutable
class DetailBook extends StatefulWidget {
  // ignore: non_constant_identifier_names
  DetailBook({super.key, this.book_id, this.account_id, this.book_uuid});

  // ignore: non_constant_identifier_names
  int? book_id;
  // ignore: non_constant_identifier_names
  int? account_id;
  // ignore: non_constant_identifier_names
  String? book_uuid;

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  final BookDetailBloc _detailBloc = BookDetailBloc();
  final ChapterBloc _chapterBloc = ChapterBloc();
  Info info = Info();
  List<InfoChapter> infoChapter = [];

  void softByIndex() {
    infoChapter.sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));
  }

  @override
  void initState() {
    super.initState();
    _detailBloc.add(GetBookDetailList(widget.book_id!, widget.account_id!));
    _chapterBloc.add(GetChapter(widget.book_uuid!, widget.account_id!));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return BlocProvider(
      create: (_) => _detailBloc,
      child: BlocConsumer<BookDetailBloc, BookDetailState>(
        listenWhen: (previous, current) {
          return current is BookDetailInitial ||
              current is BookDetailLoading ||
              current is BookDetailLoaded;
        },
        buildWhen: (previous, current) {
          return current is BookDetailLoading || current is BookDetailLoaded;
        },
        listener: (context, state) {
          if (state is BookDetailLoaded) {
            BookDetail detailBook = state.book;
            info = detailBook.info![0];
          }
        },
        builder: (context, state) {
          if (state is BookDetailLoaded) {
            return Scaffold(
              backgroundColor: const Color(0xFF1A182E),
              body: CustomScrollView(
                slivers: <Widget>[
                  banner(width),
                  BookInfo(width: width, info: info),
                  listChapter(width),
                ],
              ),
              bottomNavigationBar: DetailNav(width: width),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  SliverStack listChapter(double width) {
    return SliverStack(
      children: [
        SliverPositioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF27273F),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  color: Colors.black26,
                )
              ],
              borderRadius: BorderRadius.circular(width * 10),
            ),
          ),
        ),
        MultiSliver(
          children: [
            SliverPinnedHeader(
                child: SizedBox(
              height: width * 45,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Danh sách chương',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          setState(() {
                            infoChapter.sort(
                                (a, b) => a.sortOrder!.compareTo(b.sortOrder!));
                          });
                        },
                        style: const ButtonStyle(
                          iconColor: MaterialStatePropertyAll(Colors.white),
                        ),
                        icon: const Icon(Icons.filter_b_and_w),
                        label: const Text(
                          'Sắp xếp',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            )),
            BlocProvider(
              create: (_) => _chapterBloc,
              child: BlocConsumer<ChapterBloc, ChapterState>(
                listenWhen: (previous, current) {
                  return current is ChapterInitial ||
                      current is ChapterLoading ||
                      current is ChapterLoaded;
                },
                buildWhen: (previous, current) {
                  return current is ChapterInitial ||
                      current is ChapterLoading ||
                      current is ChapterLoaded;
                },
                listener: (context, state) {
                  if (state is ChapterLoaded) {
                    Chapter chapter = state.chapter;
                    infoChapter = chapter.info!;
                  }
                },
                builder: (context, state) {
                  if (state is ChapterLoaded) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                              height: width * 110,
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey.shade800))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: width * 6,
                                    horizontal: width * 15),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(width * 5),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              infoChapter[index].chapterImg!,
                                          placeholder: (context, url) =>
                                              Image.asset(
                                                  'assets/images/logo_footer.png'),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 8,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 10, top: width * 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    infoChapter[index]
                                                        .chapterName!,
                                                    style: TextStyle(
                                                        fontSize: width * 16),
                                                  ),
                                                  infoChapter[index]
                                                              .isPremium ==
                                                          0
                                                      ? Text(
                                                          'Free',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize:
                                                                  width * 16),
                                                        )
                                                      : Text(
                                                          'Khoá',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xFFFC5A15),
                                                              fontSize:
                                                                  width * 16),
                                                        )
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              flex: 3,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    DateFormat('dd/MM/yyyy')
                                                        .format(
                                                            infoChapter[index]
                                                                .publishDate!),
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .remove_red_eye_outlined,
                                                        size: width * 20,
                                                        color: Colors.grey,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: width * 8,
                                                                right:
                                                                    width * 15),
                                                        child: Text(
                                                          NumberFormat
                                                                  .decimalPattern()
                                                              .format(
                                                                infoChapter[
                                                                        index]
                                                                    .viewNo!,
                                                              )
                                                              .replaceAll(
                                                                  ',', '.'),
                                                          style: TextStyle(
                                                            fontSize:
                                                                width * 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right:
                                                                    width * 8),
                                                        child: Icon(
                                                          Icons
                                                              .comment_outlined,
                                                          size: width * 20,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      Text(
                                                        infoChapter[index]
                                                            .commentNo
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: width * 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        },
                        childCount: infoChapter.length,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget banner(double width) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      toolbarHeight: width * 58,
      pinned: false,
      snap: false,
      floating: false,
      expandedHeight: width * 280,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: width * 200,
                width: width * 375,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      GlobalColors.bgColor.withOpacity(0.1),
                      GlobalColors.bgColor.withOpacity(1)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      info.bookName.toString(),
                      style: TextStyle(
                          fontSize: width * 17, fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        info.authorName.toString(),
                        style: TextStyle(
                            fontSize: width * 9, fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: width * 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 8, right: width * 15),
                            child: Text(
                              NumberFormat.decimalPattern()
                                  .format(
                                    info.viewNo!,
                                  )
                                  .replaceAll(',', '.'),
                              style: TextStyle(
                                  fontSize: width * 9,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: width * 8),
                            child: Icon(
                              Icons.favorite,
                              size: width * 12,
                            ),
                          ),
                          Text(
                            info.likeNo.toString(),
                            style: TextStyle(
                                fontSize: width * 9,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        background: CachedNetworkImage(
          imageUrl: info.bookImage!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) =>
              Image.asset('assets/images/logo_footer.png'),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(width * 4),
          onTap: () {},
          highlightColor: Colors.blue.withOpacity(0.1),
          splashColor: Colors.blue.withOpacity(0.3),
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 10, right: width * 10, bottom: width * 20),
            child: Container(
                width: width * 40,
                height: width * 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.download_outlined)),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(width * 4),
          onTap: () {},
          highlightColor: Colors.blue.withOpacity(0.1),
          splashColor: Colors.blue.withOpacity(0.3),
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 10, right: width * 10, bottom: width * 20),
            child: Container(
                width: width * 40,
                height: width * 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.share_outlined)),
          ),
        ),
      ],
    );
  }
}

class DetailNav extends StatelessWidget {
  const DetailNav({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width * 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: width * 30,
            width: width * 150,
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
                  'Mở khóa chương',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 15),
            child: Container(
              width: width * 150,
              height: width * 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: GlobalColors.buttonBottomBarGradient),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'Đọc ngay',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
