import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katatarahatalk/pages/home/food_page_body.dart';
import 'package:katatarahatalk/pages/home/main_food_page.dart';
import 'package:katatarahatalk/utils/colors.dart';
import 'package:katatarahatalk/utils/dimensions.dart';
import 'package:katatarahatalk/widgets/app_column.dart';
import 'package:katatarahatalk/widgets/app_icon.dart';
import 'package:katatarahatalk/widgets/big_text.dart';
import 'package:katatarahatalk/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

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
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/image/top-view-seasonings-sauce-dark-background-meal-spicy-hot-food-color.jpg"

                  ))
                ),
          )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap:(){
                        Get.to(()=>MainFoodPage());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ]
              )
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Homemade Tomato Cream Soup"),

                    SizedBox(height: Dimensions.height20),
                    BigText(text: "Introduce"),
                    Expanded(
                      child: SingleChildScrollView(
                          child:
                            ExpandableTextWidget(text: "Experience comfort in a bowl with our Homemade Tomato Cream Soup. Made with the finest ripe tomatoes and a touch of cream, this soup is a harmonious blend of flavors and textures that will warm your heart and tantalize your taste buds. Perfectly crafted for a cozy culinary journey.")
                      ),
                    )
                  ]
                )
              )
          )


        ]
      ),
      bottomNavigationBar: Container(
       height: Dimensions.bottomHeightBar,
       padding: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, top: Dimensions.height20, bottom: Dimensions.height20),
       decoration: BoxDecoration(
         color: AppColors.buttonBackgroundColor,
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(Dimensions.radius20*2),
           topRight: Radius.circular(Dimensions.radius20*2)
         )
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
             padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20, bottom: Dimensions.height20),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(Dimensions.radius20),
               color: Colors.white
             ),
             child: Row(
               children: [
                 Icon(Icons.remove, color: AppColors.signColor),
                 SizedBox(width: Dimensions.width10/2),
                 BigText(text: "0"),
                 SizedBox(width: Dimensions.width10/2),
                 Icon(Icons.add, color: AppColors.signColor)
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20, bottom: Dimensions.height20),
             child: 
               BigText(text: "\$10 | Add to cart", color: Colors.white),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(Dimensions.radius20),
               color: AppColors.mainColor
             )
           )
         ]
       )
      )
    );
  }
}
