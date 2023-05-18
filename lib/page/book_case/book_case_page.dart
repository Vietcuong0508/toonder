import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toonder_app/screen/explore/category_book.dart';

class BookCasePage extends StatefulWidget {
  const BookCasePage({super.key});

  @override
  State<BookCasePage> createState() => _BookCasePageState();
}

class _BookCasePageState extends State<BookCasePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
        backgroundColor: const Color(0xFF1A182E),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Tủ sách', style: TextStyle(fontSize: width * 34)),
          bottom: TabBar(
            indicatorColor: const Color(0xFFFC5A15),
            controller: _tabController,
            labelStyle: TextStyle(fontSize: width * 15),
            tabs: const <Widget>[
              Tab(
                text: "Đọc gần đây",
              ),
              Tab(
                text: "Theo dõi",
              ),
              Tab(text: "Đã tải"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      height: width * 123,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 10),
                          color: const Color(0xFF27273F)),
                      child: Row(
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              SizedBox(
                                width: width * 85,
                                height: width * 123,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://wallpaperaccess.com/full/5716874.jpg',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(width * 10),
                                          bottomLeft:
                                              Radius.circular(width * 10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Image.asset(
                                      'assets/images/logo_footer.png'),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8),
                                      borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(width * 10),
                                          topLeft:
                                              Radius.circular(width * 10))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 8,
                                        vertical: width * 4),
                                    child: Text((index + 1).toString()),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // info!.updateStatus == 1
                                //     ? SizedBox(
                                //         width: width * 215,
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.end,
                                //           mainAxisSize: MainAxisSize.max,
                                //           children: [Text('data')],
                                //         ),
                                //       )
                                //     : const SizedBox(),
                                SizedBox(
                                  width: width * 215,
                                  child: Text(
                                    "info!.bookName.toString()",
                                    style: TextStyle(
                                        fontSize: width * 17,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "info!.authorNick.toString()",
                                  style: TextStyle(
                                      fontSize: width * 16,
                                      color: const Color(0xFFBAB9C0)),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Color(0xFFBAB9C0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 8, right: width * 20),
                                      child: const Text(
                                        "10000",
                                        style:
                                            TextStyle(color: Color(0xFFBAB9C0)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: width * 8),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Color(0xFFBAB9C0),
                                      ),
                                    ),
                                    const Text(
                                      "100",
                                      style:
                                          TextStyle(color: Color(0xFFBAB9C0)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      height: width * 123,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 10),
                          color: const Color(0xFF27273F)),
                      child: Row(
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              SizedBox(
                                width: width * 85,
                                height: width * 123,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://wallpaperaccess.com/full/5716874.jpg',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(width * 10),
                                          bottomLeft:
                                              Radius.circular(width * 10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Image.asset(
                                      'assets/images/logo_footer.png'),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8),
                                      borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(width * 10),
                                          topLeft:
                                              Radius.circular(width * 10))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 8,
                                        vertical: width * 4),
                                    child: Text((index + 1).toString()),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // info!.updateStatus == 1
                                //     ? SizedBox(
                                //         width: width * 215,
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.end,
                                //           mainAxisSize: MainAxisSize.max,
                                //           children: [Text('data')],
                                //         ),
                                //       )
                                //     : const SizedBox(),
                                SizedBox(
                                  width: width * 215,
                                  child: Text(
                                    "info!.bookName.toString()",
                                    style: TextStyle(
                                        fontSize: width * 17,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "info!.authorNick.toString()",
                                  style: TextStyle(
                                      fontSize: width * 16,
                                      color: const Color(0xFFBAB9C0)),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Color(0xFFBAB9C0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 8, right: width * 20),
                                      child: const Text(
                                        "10000",
                                        style:
                                            TextStyle(color: Color(0xFFBAB9C0)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: width * 8),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Color(0xFFBAB9C0),
                                      ),
                                    ),
                                    const Text(
                                      "100",
                                      style:
                                          TextStyle(color: Color(0xFFBAB9C0)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      height: width * 123,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 10),
                          color: const Color(0xFF27273F)),
                      child: Row(
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              SizedBox(
                                width: width * 85,
                                height: width * 123,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://wallpaperaccess.com/full/5716874.jpg',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(width * 10),
                                          bottomLeft:
                                              Radius.circular(width * 10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Image.asset(
                                      'assets/images/logo_footer.png'),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8),
                                      borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(width * 10),
                                          topLeft:
                                              Radius.circular(width * 10))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 8,
                                        vertical: width * 4),
                                    child: Text((index + 1).toString()),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // info!.updateStatus == 1
                                //     ? SizedBox(
                                //         width: width * 215,
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.end,
                                //           mainAxisSize: MainAxisSize.max,
                                //           children: [Text('data')],
                                //         ),
                                //       )
                                //     : const SizedBox(),
                                SizedBox(
                                  width: width * 215,
                                  child: Text(
                                    "info!.bookName.toString()",
                                    style: TextStyle(
                                        fontSize: width * 17,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "info!.authorNick.toString()",
                                  style: TextStyle(
                                      fontSize: width * 16,
                                      color: const Color(0xFFBAB9C0)),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Color(0xFFBAB9C0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 8, right: width * 20),
                                      child: const Text(
                                        "10000",
                                        style:
                                            TextStyle(color: Color(0xFFBAB9C0)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: width * 8),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Color(0xFFBAB9C0),
                                      ),
                                    ),
                                    const Text(
                                      "100",
                                      style:
                                          TextStyle(color: Color(0xFFBAB9C0)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ));
  }
}
