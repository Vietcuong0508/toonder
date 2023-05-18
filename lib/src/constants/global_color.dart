import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GlobalColors {
  static HexColor bgColor = HexColor('#1A182E');
  static HexColor bottomAppBarBgColor = HexColor('#202136');
  static HexColor nonActiveColor = HexColor('#677080');
  static HexColor orangeColor = HexColor('#EF590C');
  static HexColor purpleColor = HexColor('#CC30D6');
  static HexColor grayColor = HexColor('#C4C4C4');
  static HexColor btColor = HexColor('#27273F');
  static HexColor btrColor = HexColor('#FF0000');
  static LinearGradient buttonBottomBarGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      orangeColor,
      purpleColor,
    ],
  );
  static LinearGradient buttonFilterGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      btColor,
      btrColor,
    ],
  );
  static LinearGradient categoryBgGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [bgColor.withOpacity(0.5), nonActiveColor.withOpacity(0.6)]);
}
