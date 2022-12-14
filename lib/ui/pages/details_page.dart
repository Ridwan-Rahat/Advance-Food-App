import 'package:advance_foodapp/presentation/app_icon.dart';
import 'package:advance_foodapp/presentation/big_text.dart';
import 'package:advance_foodapp/presentation/color_manager.dart';
import 'package:advance_foodapp/presentation/container_icon_text.dart';
import 'package:advance_foodapp/presentation/dimesion.dart';
import 'package:advance_foodapp/presentation/expanded_text.dart';
import 'package:advance_foodapp/ui/body_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height30 * 12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/food_6.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.to(()=>BodyPage(),transition: Transition.fadeIn);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back,
                      size: Dimensions.height45,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    size: Dimensions.height45,
                  ),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.height30 * 11,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerIconText(
                      text: "Briyani",
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Description"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: ExpandText(
                          text:
                              "Biryani is one of the most popular dishes in South Asia, as well as among the diaspora from the region. It has gained popularity in South India, and is also prepared in other parts of the world such as Iraqi Kurdistan. Biryani is the single most-ordered dish on Indian online food ordering and delivery services."),
                    )),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height30 * 4,
        padding: EdgeInsets.only(
            top: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColor.buttonbackColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColor.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColor.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  BigText(
                    text: "Add To Cart",
                    color: Colors.white,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
