import 'package:flutter/material.dart';

class Assets{
  Assets._();
  static const arrowLeftBlack = 'assets/icons/Vector2.png';
  static const arrowLeftWhite = 'assets/icons/Vector2_white.png';
  static const processing = 'assets/images/processing.png';

}
extension AssetsHelper on String {
  Image get png => Image.asset(this);
  Image get jpg => Image.asset(this);
}
