import 'package:flutter/material.dart';

class EditInfoPage extends StatefulWidget {
  const EditInfoPage({super.key});

  @override
  State<EditInfoPage> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfoPage> {
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  void initState() {
    username.text = "";
    phoneNumber.text = "";
    super.initState();
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
        title: Text('Sửa thông tin', style: TextStyle(fontSize: width * 34)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: width * 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 10),
                        child: const Icon(Icons.person_4_outlined),
                      ),
                      const Text(
                        'Tên tài khoản : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 12),
                  child: TextField(
                      cursorColor: Colors.orange.shade900,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange.shade900)),
                        hintText: "Tên tài khoản",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: width * 10),
                          child: Icon(
                            Icons.create_outlined,
                            color: Colors.white,
                            size: width * 15,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 15,
                        ),
                        hintStyle: TextStyle(
                            fontSize: width * 13, fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: width * 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 12),
                        child: const Icon(Icons.phone_android_outlined),
                      ),
                      const Text(
                        'Số điện thoại : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 10),
                  child: TextField(
                      cursorColor: Colors.orange.shade900,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange.shade900)),
                        hintText: "Số điện thoại",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: width * 10),
                          child: Icon(
                            Icons.create_outlined,
                            color: Colors.white,
                            size: width * 15,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 15,
                        ),
                        hintStyle: TextStyle(
                            fontSize: width * 13, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            fontSize: width * 13, color: Colors.redAccent),
                      )),
                ),
              ]),
          Container(
            height: width * 40,
            width: width * 340,
            decoration: BoxDecoration(
                color: const Color(0xFF27273F),
                borderRadius: BorderRadius.circular(width * 20)),
            child: Container(
              height: width * 40,
              width: width * 110,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'Lưu',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
