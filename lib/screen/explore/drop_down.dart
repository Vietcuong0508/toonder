import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class DropDown extends StatelessWidget {
  Function? onTap;
  List<dynamic> items;
  DropDown({super.key, this.onTap, required this.items});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 812;
    double width = MediaQuery.of(context).size.width / 375;
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width * 10, vertical: width * 5),
      child: PopupMenuButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 10),
            ),
            side: const BorderSide(color: Colors.white, width: 1)),
        color: const Color(0xFF1A182E),
        offset: const Offset(1, 30),
        child: SizedBox(
          width: width * 70,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
                padding: const EdgeInsets.only(right: 2),
                child: SvgPicture.asset('assets/icons/Filter.svg')),
            const Text('Bộ lọc', style: TextStyle(color: Colors.white)),
          ]),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          for (int i = 0; i < items.length; i++)
            PopupMenuItem(
              onTap: () {
                onTap!(items[i]['value']);
              },
              height: height * 25,
              child: Row(
                children: [
                  items[i]['icon'] ?? const SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(left: width * 10),
                    child: Text(items[i]['name']),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
