import 'package:advance_foodapp/presentation/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'big_text.dart';
import 'color_manager.dart';
import 'dimesion.dart';
import 'icon_text_widgets.dart';

class ContainerIconText extends StatelessWidget {
  final String text;
  const ContainerIconText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: text,
            size: Dimensions.font24,
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      color: AppColor.mainColor,
                      size: Dimensions.iconSize25,
                    )),
              ),
              SizedBox(
                width: Dimensions.width5,
              ),
              SmallText(text: "5/5"),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "124"),
              SizedBox(
                width: 2,
              ),
              SmallText(text: "Comments")
            ],
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                icon: Icons.favorite,
                iconColor: AppColor.iconColor1,
                text: "Favorite",
              ),
              // SizedBox(
              //   width: 5,
              // ),
              IconText(
                  icon: Icons.location_on_outlined,
                  iconColor: AppColor.iconColor2,
                  text: "Location"),
              // SizedBox(
              //   width: 5,
              // ),
              IconText(
                  icon: Icons.comment,
                  iconColor: AppColor.mainColor,
                  text: "Comment")
            ],
          ),
        ],
      ),
    );
  }
}
