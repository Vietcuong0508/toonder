// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toonder_app/page/book_case/book_case_page.dart';
import 'package:toonder_app/page/explore/explore_page.dart';
import 'package:toonder_app/page/hot/hot_page.dart';
import 'package:toonder_app/page/profile/profile_page.dart';
import 'package:toonder_app/page/profile/setting_page.dart';
import 'package:toonder_app/screen/home/home_screen.dart';
import 'package:toonder_app/utils/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var bottomText = ['Trang chủ', 'Khám phá', 'Có gì Hot', 'Tủ sách', 'Của tôi'];

class _HomePageState extends State<HomePage> {
  int pgIndex = 0;
  void selIndex(int index) {
    setState(() {});
    pgIndex = index;
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const NestedMenu(),
    const HotPage(),
    const BookCasePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 375;
    var height = MediaQuery.of(context).size.height / 812;
    return Scaffold(
      backgroundColor: const Color(0xFF1A182E),
      bottomNavigationBar: SizedBox(
        height: height * 89,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF202136),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: height * 10,
            unselectedFontSize: height * 10,
            onTap: selIndex,
            currentIndex: pgIndex,
            selectedItemColor: Colors.white,
            items: [
              for (int i = 0; i < iconSvg.length; i++)
                BottomNavigationBarItem(
                    activeIcon: Container(
                      margin: EdgeInsets.only(bottom: width * 3),
                      padding: EdgeInsets.all(height * 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(
                            colors: [Color(0xFFEF590C), Color(0xFFD030D6)]),
                      ),
                      child: SvgPicture.asset(
                        iconSvg[i],
                        color: Colors.white,
                        width: width * 24,
                        height: height * 24,
                      ),
                    ),
                    icon: Container(
                      margin: EdgeInsets.only(bottom: width * 3),
                      padding: EdgeInsets.all(height * 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xFF1A182E),
                      ),
                      child: SvgPicture.asset(
                        iconSvg[i],
                        color: const Color(0xFF677080),
                        width: width * 24,
                        height: height * 24,
                      ),
                    ),
                    label: bottomText[i]),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: pgIndex,
        children: pages,
      ),
    );
  }
}
