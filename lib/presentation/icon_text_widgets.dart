import 'package:advance_foodapp/presentation/dimesion.dart';
import 'package:advance_foodapp/presentation/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  
  const IconText({Key? key,
    required this.icon,
    required this.iconColor, 
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconSize25,),
        SizedBox(width: 3,),
        SmallText(text: text)
      ],
    );
  }
}
