import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toonder_app/bloc/banner/banner_bloc.dart';
import 'package:toonder_app/model/banner_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_app/page/detail_book/detail_book.dart';
import 'package:toonder_app/src/constants/global_color.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  int _currentPage = 0;
  late Timer _timer;
  final _pageController = PageController();
  final controller = PageView();
  final BannerBloc _banner = BannerBloc();
  List<Info> info = [];

  @override
  void initState() {
    _banner.add(GetBannerList());
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage + 1;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBanner();
  }

  Widget _buildLoading() =>
      Center(child: Image.asset('assets/images/logo_footer.png'));

  Widget _buildBanner() {
    return BlocProvider(
      create: (_) => _banner,
      child: BlocConsumer<BannerBloc, BannerState>(
        listenWhen: (previous, current) {
          return current is BannerInitial || current is BannerLoading;
        },
        buildWhen: (previous, current) {
          return current is BannerLoaded;
        },
        listener: (context, state) {
          if (state is BannerError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
          if (state is BannerLoaded) {
            BookBanner banner = state.banner;
            info = banner.info!;
          }
        },
        builder: (context, state) {
          if (state is BannerLoaded) {
            BookBanner model = state.banner;
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                      controller: _pageController,
                      itemCount: model.info!.length,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // print(model.info![index].bookId);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailBook(
                                          book_id: model.info![index].bookId,
                                          account_id: 50336,
                                          book_uuid:
                                              model.info![index].bookUuid,
                                        )));
                          },
                          child: CachedNetworkImage(
                            imageUrl: model.info![index].imgUrl!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
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
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: buildIndicator(model.info!.length),
                  ),
                ],
              ),
            );
          } else {
            return _buildLoading();
          }
        },
      ),
    );
  }

  Widget buildIndicator(int length) => AnimatedSmoothIndicator(
        activeIndex: _currentPage,
        count: 5,
        onDotClicked: animateToSlide,
        effect: ScrollingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            dotColor: Colors.white,
            activeDotColor: GlobalColors.orangeColor,
            activeDotScale: 2),
      );

  void animateToSlide(int index) => _pageController.animateToPage(index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linearToEaseOut);
}
