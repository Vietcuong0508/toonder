import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toonder_app/model/explore_model.dart';
import 'package:toonder_app/page/detail_book/detail_book.dart';
import 'package:toonder_app/src/constants/global_color.dart';

// ignore: must_be_immutable
class CategoryBook extends StatelessWidget {
  CategoryBook({super.key, this.info, this.index});

  Info? info;
  int? index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    double height = MediaQuery.of(context).size.height / 812;

    // ignore: unrelated_type_equality_checks
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        height: height * 123,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 10),
            color: const Color(0xFF27273F)),
        child: InkWell(
          onTap: () {
            // print(model.info![index].bookId);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailBook(
                          book_id: info!.bookId,
                          account_id: 50336,
                          book_uuid: info!.bookUuid,
                        )));
          },
          child: Row(
            children: [
              Stack(
                fit: StackFit.loose,
                alignment: AlignmentDirectional.topStart,
                children: [
                  SizedBox(
                    width: width * 85,
                    height: height * 123,
                    child: CachedNetworkImage(
                      imageUrl: '${info!.imgUrl}',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width * 10),
                              bottomLeft: Radius.circular(width * 10)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          Image.asset('assets/images/logo_footer.png'),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(width * 10),
                              topLeft: Radius.circular(width * 10))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 8, vertical: width * 4),
                        child: Text(index.toString()),
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
                    info!.updateStatus == 1
                        ? SizedBox(
                            width: width * 215,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [Text('data')],
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      width: width * 215,
                      child: Text(
                        info!.bookName.toString(),
                        style: TextStyle(
                            fontSize: width * 17, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      info!.authorNick.toString(),
                      style: TextStyle(
                          fontSize: width * 16, color: const Color(0xFFBAB9C0)),
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
                          child: Text(
                            info!.viewNo.toString(),
                            style: const TextStyle(color: Color(0xFFBAB9C0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 8),
                          child: const Icon(
                            Icons.favorite,
                            color: Color(0xFFBAB9C0),
                          ),
                        ),
                        Text(
                          info!.totalLikeNo.toString(),
                          style: const TextStyle(color: Color(0xFFBAB9C0)),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
