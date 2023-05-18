import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    List<dynamic> listButton = [];
    listButton.add({
      'icon': 'assets/images/notification.png',
      'name': 'Cài đặt thông báo'
    });
    listButton.add(
        {'icon': 'assets/images/data-cleaning.png', 'name': 'Xóa bộ nhớ đệm'});
    listButton.add({'icon': 'assets/images/language.png', 'name': 'Ngôn ngữ'});
    listButton.add(
        {'icon': 'assets/images/question.png', 'name': 'Liên hệ chúng tôi'});
    listButton.add({'icon': 'assets/images/info.png', 'name': 'Về chúng tôi'});
    listButton
        .add({'icon': 'assets/images/unlock.png', 'name': 'Thay đổi mật khẩu'});
    listButton.add({'icon': 'assets/images/arrow.png', 'name': 'Đăng xuất'});
    listButton
        .add({'icon': 'assets/images/block-user.png', 'name': 'Xóa tài khoản'});

    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
        backgroundColor: const Color(0xFF1A182E),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Cài đặt', style: TextStyle(fontSize: width * 34)),
        ),
        body: Column(
          children: [
            InkWell(
              highlightColor: Colors.grey.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(width * 20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 10),
                      child: Image.asset(
                        '${listButton[0]['icon']}',
                        width: width * 25,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      listButton[0]['name'],
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.grey.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(width * 20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 10),
                      child: Image.asset(
                        '${listButton[1]['icon']}',
                        width: width * 25,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      listButton[1]['name'],
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: width * 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 10),
                        child: Image.asset(
                          '${listButton[2]['icon']}',
                          width: width * 25,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        listButton[2]['name'],
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 15),
                    child: FlutterSwitch(
                      width: width * 60,
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey,
                      activeText: 'Vie',
                      inactiveText: 'Eng',
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                      activeTextColor: Colors.black,
                      inactiveTextColor: Colors.black,
                      valueFontSize: width * 10,
                      value: status,
                      duration: const Duration(milliseconds: 400),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              highlightColor: Colors.grey.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(width * 20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 10),
                      child: Image.asset(
                        '${listButton[3]['icon']}',
                        width: width * 25,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      listButton[3]['name'],
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.grey.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(width * 20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 10),
                      child: Image.asset(
                        '${listButton[4]['icon']}',
                        width: width * 25,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      listButton[4]['name'],
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.grey.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(width * 20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 10),
                      child: Image.asset(
                        '${listButton[5]['icon']}',
                        width: width * 25,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      listButton[5]['name'],
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.grey.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(width * 20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 10),
                      child: Image.asset(
                        '${listButton[6]['icon']}',
                        width: width * 25,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      listButton[6]['name'],
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.grey.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(width * 20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 10),
                      child: Image.asset(
                        '${listButton[7]['icon']}',
                        width: width * 25,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      listButton[7]['name'],
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
