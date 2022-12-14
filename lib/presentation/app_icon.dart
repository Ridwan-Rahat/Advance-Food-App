import 'package:advance_foodapp/presentation/dimesion.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backColor;
  final Color iconColor;
   final double size;
  AppIcon({Key? key,
  required this.icon,
    this.iconColor=const Color(0xFF756D54),
    this.backColor=const Color(0xFFfcf4e4),
    this.size= 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.height20,
      ),
    );
  }
}
