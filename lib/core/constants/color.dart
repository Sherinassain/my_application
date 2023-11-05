import 'package:flutter/material.dart';

class ColorConst {
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color red = Colors.red;

  static Color appColor = Color(0xffE34950);
  static Color black26 = Color(0xff262626);
  static Color black1F = Color(0xff1F2B2E);
  static Color greyDD = Color(0xffDDDDDD);
  static Color greyCC = Color(0xffCCCCCC);
  static Color greyBB = Color(0xffBBBBBB);
  static Color grey83 = Color(0xff838383);
  static Color grey8E = Color(0xff8E8E93);
  static Color greyF2 = Color(0xffF2F2F7);
  static Color green3D = Color(0xff3DBA42);
  static Color redC9 = Color(0xffC91507);
  static Color customTextFieldBorderColor = const Color(0xFFDDDDDD);
  static Color customTextFieldContentColor = const Color(0xFF777777);
  static Color customTextFieldFillColor = Colors.white;
 static Color appUpdateGreenColor = fromHex('#07AA4D');
  static Color loginContainerColor = fromHex('#f4f4f4');

 static Color appUpdateTextColor = fromHex('#FFFFFF');
 static Color redButtonColor = fromHex('#EB2427');

    static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
