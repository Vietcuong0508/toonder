import 'package:flutter/material.dart';

// ignore: unused_element
class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 375;
    var height = MediaQuery.of(context).size.height / 812;
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
                Padding(
                  padding: EdgeInsets.only(left: height * 15),
                  child: const Text(
                    'Cường Trần',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 20),
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
                                Text('Số dư xu',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height * 20)),
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
                                Text('Số dư điểm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height * 20)),
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
