import 'package:advance_foodapp/presentation/big_text.dart';
import 'package:advance_foodapp/presentation/color_manager.dart';
import 'package:advance_foodapp/presentation/dimesion.dart';
import 'package:advance_foodapp/presentation/small_text.dart';
import 'package:advance_foodapp/ui/body_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Container(

            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height20),
              padding: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Bangladesh",
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Khulna",
                            size: 14,
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.width45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize25,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColor.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: BodyPage()),),
        ],
      ),
    );
  }
}
