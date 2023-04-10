import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toonder_app/data/book.dart';
import 'package:toonder_app/data/home_banner.dart';
import 'package:toonder_app/screen/Home/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiUrl = 'https://api.toonder.vn/wecomi/api/book/getbanner';
  final apiBookUrl =
      'https://api.toonder.vn/wecomi/api/book/mainhome?account_id=50231';
  int activeIndex = 0;
  final controller = CarouselController();
  Books? book;
  @override
  void initState() {
    super.initState();
    books();
  }

  Future<void> books() async {
    book = await fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFC4C4C4).withOpacity(0.7)),
          child: IconButton(
            splashRadius: 18,
            iconSize: 16,
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFC4C4C4).withOpacity(0.7),
            ),
            child: IconButton(
              splashRadius: 18,
              iconSize: 16,
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFC4C4C4).withOpacity(0.7),
            ),
            child: IconButton(
              splashRadius: 18,
              iconSize: 16,
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            bookBanner(),
            book == null
                ? const CircularProgressIndicator()
                : ListTitle(book: book)
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<BookBanner>> bookBanner() {
    return FutureBuilder<List<BookBanner>>(
            future: fetchBanners(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<BookBanner> bookBanner =
                    snapshot.data as List<BookBanner>;
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller,
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1,
                        height: MediaQuery.of(context).size.height * 0.7,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                      itemCount: bookBanner.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = bookBanner[index].imgUrl;
                        return SizedBox(
                          width: double.infinity,
                          child: buildImage(urlImage, index),
                        );
                      },
                    ),
                    buildIndicator(bookBanner.length),
                  ],
                );
              }
              if (snapshot.hasError) {
                // ignore: avoid_print
                print(snapshot.error.toString());
                return const Text('error');
              }
              return const CircularProgressIndicator();
            },
          );
  }

  Future<List<BookBanner>> fetchBanners() async {
    var response = await http.get(Uri.parse(apiUrl));
    // print(response.toString());
    return (json.decode(response.body)['info'] as List)
        .map((e) => BookBanner.fromJson(e))
        .toList();
  }

  Widget buildImage(String urlImage, int index) => ColoredBox(
        color: Colors.transparent,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.7,
        ),
      );

  Widget buildIndicator(int length) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: length,
        onDotClicked: animateToSlide,
        effect: const ScrollingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            dotColor: Colors.white,
            activeDotColor: Color(0xFFEF590C)),
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  
  Future<Books?> fetchBooks() async {
    final Response response;
    response = await http.get(Uri.parse(apiBookUrl));
    final decode = json.decode(response.body);

    if (response.statusCode == 200) {
      // print(decode.toString());
      return Books.fromJson(decode);
    } else {
      return null;
    }
  }
}