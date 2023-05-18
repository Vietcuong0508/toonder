import 'package:flutter/material.dart';
import 'package:toonder_app/src/constants/global_color.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {Key? key,
      required this.name,
      this.active = false,
      required this.onTap,
      this.textStyle = const TextStyle(fontSize: 16)})
      : super(key: key);
  String name;
  late bool active;
  late TextStyle textStyle;
  late VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(vertical: width * 4),
      height: 30,
      decoration: BoxDecoration(
          gradient: active ? GlobalColors.categoryBgGradient : null,
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, shadowColor: Colors.transparent),
        child: Text(name, style: textStyle),
      ),
    );
  }
}
