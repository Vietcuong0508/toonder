import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toonder_app/page/home/banner.dart';
import 'package:toonder_app/page/home/list_book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
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
        //     onPressed: () {
        //       Scaffold.of(context).openDrawer();
        //     },
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
      drawer: const _Drawer(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const BannerPage(),
            const ListBook(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: width * 40,
                width: width * 298,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFEF590C),
                      Color(0xFFD030D6),
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: const Text(
                      'KHÁM PHÁ THÊM',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0,
          MediaQuery.of(context).padding.bottom),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.8,
      child: DrawerHeader(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Color(0xFF1A182E),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(color: Colors.white, blurRadius: 3),
          ],
        ),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(15)),
          child: Drawer(
            backgroundColor: const Color(0xFF1A182E),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Cường Trần',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.125,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 255, 89, 0),
                                width: 0.7),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 35, 33, 60)),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            iconColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Số dư xu',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text('1',
                                        style: TextStyle(color: Colors.white)),
                                    Icon(Icons.abc)
                                  ],
                                )
                              ]),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.125,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 255, 89, 0),
                                width: 0.7),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 35, 33, 60)),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            iconColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Số dư điểm',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text('1',
                                        style: TextStyle(color: Colors.white)),
                                    Icon(Icons.abc_outlined)
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  leading: const Icon(Icons.rocket_launch_outlined),
                  title: const Text('Nhiệm vụ nhận điểm'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  leading: const Icon(Icons.diamond_outlined),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  leading: const Icon(Icons.money_off_csred_outlined),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  leading: const Icon(Icons.co_present),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  leading: const Icon(Icons.settings_rounded),
                  title: const Text('Cài đặt'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
