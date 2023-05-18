import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toonder_app/page/profile/info_page.dart';
import 'package:toonder_app/page/profile/setting_page.dart';
import 'package:toonder_app/src/constants/global_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> listButton = [];
    listButton.add({'icon': 'assets/images/diamond.png', 'name': 'Hội viên'});
    listButton.add({'icon': 'assets/images/coupon.png', 'name': 'Đổi coupon'});
    listButton.add({'icon': 'assets/images/chat.png', 'name': 'Bình luận'});
    listButton.add({'icon': 'assets/images/kite.png', 'name': 'Mời bạn'});
    listButton
        .add({'icon': 'assets/images/money.png', 'name': 'Lịch sử giao dịch'});
    listButton.add({'icon': 'assets/images/calendar.png', 'name': 'Sự kiện'});
    listButton.add({'icon': 'assets/images/gift-box.png', 'name': 'Gift code'});
    listButton.add({'icon': 'assets/images/rocket.png', 'name': 'Nhiệm vụ'});

    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      backgroundColor: const Color(0xFF1A182E),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Của tôi', style: TextStyle(fontSize: width * 34)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage()));
                },
                icon: const Icon(Icons.settings))
          ]),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: width * 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 4,
                  child: CachedNetworkImage(
                    imageUrl: 'https://wallpaperaccess.com/full/5716874.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      width: width * 90,
                      height: width * 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
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
                Flexible(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Cuong Tran"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ID.0928984923490",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Icon(Icons.copy_all_sharp,
                              color: Colors.grey.shade700)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: width * 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: GlobalColors.categoryBgGradient),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const InfoPage()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: Text(
                                  'Thông tin',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 15),
                            child: Container(
                              height: width * 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient:
                                      GlobalColors.buttonBottomBarGradient),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  child: Text(
                                    'Nạp xu',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: width * 148,
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 1, color: Colors.white))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.shield_moon_outlined,
                      color: Colors.amber.shade900,
                    ),
                    SizedBox(
                      width: width * 300,
                      child: Text(
                        "Vui lòng xác thực để bảo vệ tài khoản của bạn trên hệ thống Toonder.",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: width * 17),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * 15),
                  child: Container(
                    height: width * 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: GlobalColors.buttonBottomBarGradient),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: Text(
                          'Đến trang xác thực',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 17,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: width * 135,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.white))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text('Số dư'),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(flex: 7, child: Text('Xu')),
                        Flexible(
                            flex: 3,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(Icons.circle_sharp),
                                Text("6")
                              ],
                            ))
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(flex: 7, child: Text('Điểm')),
                        Flexible(
                            flex: 3,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(Icons.circle_sharp),
                                Text("116")
                              ],
                            ))
                      ],
                    ),
                  ]),
            ),
          ),
          SizedBox(
            width: width * 375,
            height: width * 200,
            child: Padding(
              padding: EdgeInsets.only(top: width * 15),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listButton.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    highlightColor: Colors.blue.withOpacity(0.1),
                    splashColor: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(width * 10),
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          '${listButton[index]['icon']}',
                          width: width * 30,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: width * 20),
                          child: Text(
                            listButton[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: width * 13,
                                color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
