import 'package:advance_foodapp/model/controllers/popular_food_controller.dart';
import 'package:advance_foodapp/model/controllers/recommended_food_controller.dart';
import 'package:advance_foodapp/model/product_model.dart';
import 'package:advance_foodapp/presentation/app_const.dart';
import 'package:advance_foodapp/presentation/big_text.dart';
import 'package:advance_foodapp/presentation/color_manager.dart';
import 'package:advance_foodapp/presentation/container_icon_text.dart';
import 'package:advance_foodapp/presentation/dimesion.dart';
import 'package:advance_foodapp/presentation/icon_text_widgets.dart';
import 'package:advance_foodapp/presentation/small_text.dart';
import 'package:advance_foodapp/ui/pages/details_page.dart';
import 'package:advance_foodapp/ui/pages/popular_food_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  double _currFraction = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       GetBuilder<PopularFoodController>(builder: (popularProducts){
         return popularProducts.isLoaded?Container(
           height: Dimensions.pageView,

             child: PageView.builder(
                 controller: pageController,

                 itemCount: popularProducts.popularFoodList.length,
                 itemBuilder: (context, index) {
                   return _buildPageitem(index,popularProducts.popularFoodList[index]);
                 }),

         ):CircularProgressIndicator(color: AppColor.mainColor,) ;
       }),
       GetBuilder<PopularFoodController>(builder: (popularProducts){
         return  DotsIndicator(
           dotsCount: popularProducts.popularFoodList.length<=0?1:popularProducts.popularFoodList.length,
           position: _currPageValue,
           decorator: DotsDecorator(
               activeColor: AppColor.mainColor,
               size: Size.square(9.0),
               activeSize: Size(18.0, 9.0),
               activeShape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(5.0))),
         );
       }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: ".",
                    color: AppColor.textColor,
                  )),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: SmallText(
                    text: "By Views",
                    color: AppColor.textColor,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height20,
        ),

         GetBuilder<RecommendedFoodController>(builder: (recommendedProducts){
           return recommendedProducts.isLoaded?  ListView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),

               itemCount: recommendedProducts.recommendedFoodList.length,
               itemBuilder: (context, index) {
                 return GestureDetector(
                   onTap: (){
                     Get.to(()=>PopularFood());
                   },
                   child: Container(
                     margin: EdgeInsets.only(
                       left: Dimensions.width15,
                       right: Dimensions.width15,
                       // top: Dimensions.height15,
                       bottom: Dimensions.height15,
                     ),
                     child: Row(
                       children: [
                         Container(
                           height: Dimensions.listViewImageh,
                           width: Dimensions.listViewImagew,
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image:NetworkImage(AppConstants.Base_Url+AppConstants.Upload_Url+recommendedProducts.recommendedFoodList[index].img!),
                               fit: BoxFit.cover,
                             ),
                             borderRadius:
                             BorderRadius.circular(Dimensions.radius20),
                           ),
                         ),
                         Expanded(
                           child: Container(
                             height: Dimensions.listViewTextContainer,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                     topRight: Radius.circular(Dimensions.radius20),
                                     bottomRight:Radius.circular(Dimensions.radius20)),
                                 color: Colors.white),
                             child: Padding(
                               padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   BigText(text: recommendedProducts.recommendedFoodList[index].name!),
                                   SizedBox(height: Dimensions.height10,),
                                   SmallText(text: "Authentic Chinese Food"),
                                   SizedBox(height: Dimensions.height10,),
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
                                           text: "1.2 km"),
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
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 );
               }):CircularProgressIndicator(color: AppColor.mainColor,);
         }),

      ],
    );
  }

  Widget _buildPageitem(int index,Products popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _currFraction);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _currFraction + (_currPageValue - index + 1) * (1 - _currFraction);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _currFraction);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.to(()=>DetailPage());
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width5, right: Dimensions.width5,top: Dimensions.height15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                // color: index.isEven ? Colors.blue : Colors.cyanAccent,
                image: DecorationImage(
                  image:NetworkImage(AppConstants.Base_Url+AppConstants.Upload_Url+popularProduct.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 8.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    right: Dimensions.height15,
                    left: Dimensions.height15),
                child: ContainerIconText(text: popularProduct.name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
