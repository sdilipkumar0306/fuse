import 'package:flutter/material.dart';

class UiConstants {
  static const String logopath = "assets/images/fuse.png";
  static const String loadingGif1 = "assets/images/loader.gif";
  static const String loadingGif2 = "assets/images/loading.gif";
  static const String appName = "Fuse";
  static const Color myColor = Color(0xff072b30);
  static final Color mainPageColor = Colors.indigo.shade400;
  static const Color appBarElementsColor = Colors.white;


  static RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

}
