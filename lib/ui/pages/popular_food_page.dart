import 'package:advance_foodapp/presentation/big_text.dart';
import 'package:advance_foodapp/presentation/color_manager.dart';
import 'package:advance_foodapp/presentation/dimesion.dart';
import 'package:advance_foodapp/presentation/expanded_text.dart';
import 'package:advance_foodapp/ui/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../presentation/app_icon.dart';

class PopularFood extends StatelessWidget {
  const PopularFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.height45*2,
            title: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                    Get.to(()=>HomePage());
                  },
                  child: AppIcon(
                    icon: Icons.clear,
                    size: Dimensions.height45,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  size: Dimensions.height45,
                ),
              ],
            ),
            bottom: PreferredSize(

              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10, bottom: Dimensions.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20)),
                  color: Colors.white,
                ),
                width: double.maxFinite,
                child: Center(
                    child: BigText(
                  text: "Fresh SeaFood Salad",
                  size: Dimensions.font24,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColor.yellowColor,
            expandedHeight: Dimensions.height30 * 11,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food_2.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:Column(
              children: [
                Container(
                  margin:EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20,
                  top: Dimensions.height10,bottom: Dimensions.height10),
                  child: ExpandText(text: "A retro classic, this seafood salad recipe has been a staple in delis and on salad bars for decades! The cold crab salad comes together in about 10 minutes for an inexpensive, easy lunch or dinner to prep ahead. Serve it with crackers for scooping, on croissants or crusty bread for sandwiches, or on a bed of leafy greens. It's light, fresh, and flavorful! I have loved this vintage Seafood Salad recipe since I was a child! The classic dish is made with imitation crab, which I've shown here, but you can also prepare the dish with shrimp, lobster or real crabmeat to make it your own. The cold crab salad is just a perfect light lunch or dinner when the weather is warm and you don't want a heavy, hot meal. Best of all, it comes together in just 10 minutes and can be prepared in advance. So convenient!",),
                )
              ],
            ),
          ),
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
              child:Icon(Icons.favorite,color: AppColor.mainColor,),
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
