import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toonder_app/data/book.dart';
import 'package:toonder_app/data/home_banner.dart';
import 'package:toonder_app/screen/Home/home_body.dart';
import 'package:toonder_app/src/constants/global_color.dart';
import 'package:toonder_app/utils/theme.dart';

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
      backgroundColor: const Color(0xFF1A182E),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: Container(
        //   margin: const EdgeInsets.all(10.0),
        //   decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: const Color(0xFFC4C4C4).withOpacity(0.7)),
        //   child: IconButton(
        //     splashRadius: 18,
        //     iconSize: 16,
        //     onPressed: () {},
        //     icon: const Icon(Icons.menu),
        //   ),
        // ),
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
      drawer: Padding(
        padding: const EdgeInsets.only(
          top: 34,
          bottom: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: const Color.fromARGB(83, 255, 255, 255)),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: Drawer(
              shadowColor: Colors.white,
              backgroundColor: const Color(0xFF1A182E),
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Messages'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Profile'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            bookBanner(),
            book == null
                ? const CircularProgressIndicator()
                : ListTitle(book: book),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFEF590C),
                      Color(0xFFD030D6),
                    ],
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'KHÁM PHÁ THÊM',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
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
          List<BookBanner> bookBanner = snapshot.data as List<BookBanner>;
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider.builder(
                carouselController: controller,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1,
                  autoPlayInterval: const Duration(seconds: 3),
                  height: MediaQuery.of(context).size.height * 0.74,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: buildIndicator(bookBanner.length),
              ),
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

  Widget buildImage(String urlImage, int index) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                urlImage,
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          height: 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                GlobalColors.bgColor.withOpacity(0.1),
                GlobalColors.bgColor.withOpacity(1)
              ],
            ),
          ),
        ),
      );

  Widget buildIndicator(int length) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: length,
        onDotClicked: animateToSlide,
        effect: ScrollingDotsEffect(
          dotWidth: 10,
          dotHeight: 10,
          dotColor: Colors.white,
          activeDotColor: GlobalColors.orangeColor,
        ),
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
