import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toonder_app/page/profile/edit_page.dart';

import '../../src/constants/global_color.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  File? imageFile;

  _getFromGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  _getFromCamera() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      backgroundColor: const Color(0xFF1A182E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Thông tin', style: TextStyle(fontSize: width * 34)),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.83,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              avatar(width, context),
              Container(
                height: width * 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: GlobalColors.categoryBgGradient),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                          context: context, builder: (_) => chooseImage(width));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: Text(
                      'Thay avatar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
              AccountInfo(width: width),
              LoginMethod(width: width),
            ],
          ),
        ),
      ),
    );
  }

  Widget avatar(double width, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: 'https://wallpaperaccess.com/full/5716874.jpg',
          imageBuilder: (context, imageProvider) => Container(
            width: width * 150,
            height: width * 150,
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
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(),
        CircleAvatar(
          minRadius: width * 75,
          backgroundColor: const Color(0xFF1A182E).withOpacity(0.5),
          child: IconButton(
            onPressed: () async {
              await showDialog(
                  context: context, builder: (_) => chooseImage(width));
            },
            icon: Image.asset(
              'assets/images/pencil.png',
              width: width * 20,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget chooseImage(double width) {
    return Dialog(
      child: Container(
        width: width * 200,
        height: width * 130,
        decoration: const BoxDecoration(
          color: Color(0xFF27273F),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Chọn nguồn ảnh',
              style: TextStyle(fontSize: width * 17),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      _getFromCamera();
                    },
                    icon: const Icon(Icons.camera_alt)),
                IconButton(
                    onPressed: () {
                      _getFromGallery();
                    },
                    icon: const Icon(Icons.image)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginMethod extends StatelessWidget {
  const LoginMethod({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 175,
      width: width * 345,
      decoration: BoxDecoration(
          color: const Color(0xFF27273F),
          borderRadius: BorderRadius.circular(width * 10)),
      child: Padding(
        padding: EdgeInsets.only(left: width * 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Phương thức đăng nhập',
                style: TextStyle(
                    fontSize: width * 15, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 10),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                      imageBuilder: (context, imageProvider) => Container(
                        width: width * 30,
                        height: width * 30,
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
                  const Text('Đăng nhập bằng google')
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 20),
                    child: Container(
                      height: width * 40,
                      width: width * 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: GlobalColors.categoryBgGradient),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'Xóa liên kết',
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
            ]),
      ),
    );
  }
}

class AccountInfo extends StatelessWidget {
  const AccountInfo({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 210,
      width: width * 345,
      decoration: BoxDecoration(
          color: const Color(0xFF27273F),
          borderRadius: BorderRadius.circular(width * 10)),
      child: Padding(
        padding: EdgeInsets.only(left: width * 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Thông tin tài khoản',
                style: TextStyle(
                    fontSize: width * 15, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 10),
                    child: const Icon(Icons.person_4_outlined),
                  ),
                  const Text('Tên tài khoản: '),
                  const Text(
                    'Cường Trần',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 10),
                    child: const Icon(Icons.phone_android_outlined),
                  ),
                  const Text('Số điện thoại: '),
                  const Text('Chưa có thông tin',
                      style: TextStyle(fontStyle: FontStyle.italic))
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 10),
                    child: const Icon(Icons.diamond_outlined),
                  ),
                  const Text('Tình trạng hội viên: '),
                  const Text('Thường',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 20),
                    child: Container(
                      height: width * 40,
                      width: width * 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: GlobalColors.buttonBottomBarGradient),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditInfoPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'Sửa',
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
            ]),
      ),
    );
  }
}
