// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toonder_app/screen/explore_screen.dart';
import 'package:toonder_app/screen/home_screen.dart';
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
    const ExploreScreen(),
    const ExploreScreen(),
    const ExploreScreen(),
    const ExploreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      bottomNavigationBar: SizedBox(
        height: 89,
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
            selectedFontSize: 10,
            unselectedFontSize: 10,
            onTap: selIndex,
            currentIndex: pgIndex,
            selectedItemColor: Colors.white,
            items: [
              for(int i=0;i<iconSvg.length; i++)
              BottomNavigationBarItem(
                  activeIcon: Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                          colors: [Color(0xFFEF590C), Color(0xFFD030D6)]),
                    ),
                    child: SvgPicture.asset(iconSvg[i],color: Colors.white,),
                  ),
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF1A182E),
                    ),
                    child: SvgPicture.asset(
                      iconSvg[i],
                      color: const Color(0xFF677080),
                    ),
                  ),
                  label: bottomText[i]),
              // BottomNavigationBarItem(
              //     activeIcon: Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         gradient: const LinearGradient(
              //             colors: [Color(0xFFEF590C), Color(0xFFD030D6)]),
              //       ),
              //       child: SvgPicture.asset(
              //         'assets/icons/Explore.svg',
              //         // ignore: deprecated_member_use
              //         color: Colors.white,
              //         height: 24,
              //       ),
              //     ),
              //     icon: Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         color: const Color(0xFF1A182E),
              //       ),
              //       child: SvgPicture.asset(
              //         'assets/icons/Explore.svg',
              //         height: 24,
              //       ),
              //     ),
              //     label: "Khám phá"),
              // BottomNavigationBarItem(
              //     activeIcon: Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         gradient: const LinearGradient(
              //             colors: [Color(0xFFEF590C), Color(0xFFD030D6)]),
              //       ),
              //       child: SvgPicture.asset(
              //         'assets/icons/Hot.svg',
              //         height: 24,
              //         color: Colors.white,
              //       ),
              //     ),
              //     icon: Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         color: const Color(0xFF1A182E),
              //       ),
              //       child: SvgPicture.asset(
              //         'assets/icons/Hot.svg',
              //         height: 24,
              //       ),
              //     ),
              //     label: "Có gì HOT"),
              // BottomNavigationBarItem(
              //     activeIcon: Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         gradient: const LinearGradient(
              //             colors: [Color(0xFFEF590C), Color(0xFFD030D6)]),
              //       ),
              //       child: SvgPicture.asset(
              //         'assets/icons/Book.svg',
              //         height: 24,
              //         color: Colors.white,
              //       ),
              //     ),
              //     icon: Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         color: const Color(0xFF1A182E),
              //       ),
              //       child: SvgPicture.asset(
              //         'assets/icons/Book.svg',
              //         height: 24,
              //         // ignore: deprecated_member_use
              //         color: const Color(0xFF677080),
              //       ),
              //     ),
              //     label: "Tủ Sách"),
              // BottomNavigationBarItem(
              //     activeIcon: Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       padding: const EdgeInsets.only(
              //           right: 15, top: 12, left: 15, bottom: 12),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         gradient: const LinearGradient(
              //             colors: [Color(0xFFEF590C), Color(0xFFD030D6)]),
              //       ),
              //       child: SvgPicture.asset(
              //         'assets/icons/My.svg',
              //         color: Colors.white,
              //         height: 24,
              //       ),
              //     ),
              //     icon: Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       padding: const EdgeInsets.only(
              //           right: 15, top: 12, left: 15, bottom: 12),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         color: const Color(0xFF1A182E),
              //       ),
              //       child: SvgPicture.asset(
              //         'assets/icons/My.svg',
              //         height: 24,
              //       ),
              //     ),
              //     label: "Của tôi")
            ],
          ),
        ),
      ),
      body: pages[pgIndex],
    );
  }
}