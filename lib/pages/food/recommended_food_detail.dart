import 'package:flutter/material.dart';
import 'package:katatarahatalk/utils/colors.dart';
import 'package:katatarahatalk/utils/dimensions.dart';
import 'package:katatarahatalk/widgets/app_icon.dart';
import 'package:katatarahatalk/widgets/big_text.dart';
import 'package:katatarahatalk/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ]
            ),
            bottom: PreferredSize(
                child: Container(
                  child: Center(
                      child: BigText(text: "Homemade Tomato Cream Soup", size: Dimensions.font26)
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)
                    ),
                    color: Colors.white,
                  )
                ),
                preferredSize: Size.fromHeight(20)
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/top-view-seasonings-sauce-dark-background-meal-spicy-hot-food-color.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: ExpandableTextWidget(text: "Indulge in the comforting flavors of our Homemade Tomato Cream Soup. Bursting with the rich essence of ripe tomatoes, this velvety-smooth soup is a delightful blend of wholesome ingredients and savory creaminess. Each spoonful offers a perfect balance of tangy sweetness and luxurious texture, making it an ideal choice for a heartwarming meal. Whether enjoyed on its own or paired with your favorite crusty bread, our Tomato Cream Soup is a culinary embrace that brings the warmth of homemade goodness to your doorstep. Indulge in the comforting flavors of our Homemade Tomato Cream Soup. Bursting with the rich essence of ripe tomatoes, this velvety-smooth soup is a delightful blend of wholesome ingredients and savory creaminess. Each spoonful offers a perfect balance of tangy sweetness and luxurious texture, making it an ideal choice for a heartwarming meal. Whether enjoyed on its own or paired with your favorite crusty bread, our Tomato Cream Soup is a culinary embrace that brings the warmth of homemade goodness to your doorstep. Indulge in the comforting flavors of our Homemade Tomato Cream Soup. Bursting with the rich essence of ripe tomatoes, this velvety-smooth soup is a delightful blend of wholesome ingredients and savory creaminess. Each spoonful offers a perfect balance of tangy sweetness and luxurious texture, making it an ideal choice for a heartwarming meal. Whether enjoyed on its own or paired with your favorite crusty bread, our Tomato Cream Soup is a culinary embrace that brings the warmth of homemade goodness to your doorstep. Indulge in the comforting flavors of our Homemade Tomato Cream Soup. Bursting with the rich essence of ripe tomatoes, this velvety-smooth soup is a delightful blend of wholesome ingredients and savory creaminess. Each spoonful offers a perfect balance of tangy sweetness and luxurious texture, making it an ideal choice for a heartwarming meal. Whether enjoyed on its own or paired with your favorite crusty bread, our Tomato Cream Soup is a culinary embrace that brings the warmth of homemade goodness to your doorstep. Indulge in the comforting flavors of our Homemade Tomato Cream Soup. Bursting with the rich essence of ripe tomatoes, this velvety-smooth soup is a delightful blend of wholesome ingredients and savory creaminess. Each spoonful offers a perfect balance of tangy sweetness and luxurious texture, making it an ideal choice for a heartwarming meal. Whether enjoyed on its own or paired with your favorite crusty bread, our Tomato Cream Soup is a culinary embrace that brings the warmth of homemade goodness to your doorstep. Indulge in the comforting flavors of our Homemade Tomato Cream Soup. Bursting with the rich essence of ripe tomatoes, this velvety-smooth soup is a delightful blend of wholesome ingredients and savory creaminess. Each spoonful offers a perfect balance of tangy sweetness and luxurious texture, making it an ideal choice for a heartwarming meal. Whether enjoyed on its own or paired with your favorite crusty bread, our Tomato Cream Soup is a culinary embrace that brings the warmth of homemade goodness to your doorstep."),
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20)
                  )
                ]
              )
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    icon: Icons.remove,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                    backgroundColor: AppColors.mainColor
                ),
                BigText(
                    text: "\$12.88 "+"X"+" 0",
                    color: AppColors.mainBlackColor
                ),
                AppIcon(
                    icon: Icons.add,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                    backgroundColor: AppColors.mainColor
                )
              ]
            ),
          ),
          Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor
                      )
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
        ]
      )
    );
  }
}
