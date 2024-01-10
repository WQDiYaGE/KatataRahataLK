import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katatarahatalk/controllers/popular_product_controller.dart';
import 'package:katatarahatalk/controllers/recommended_product_controller.dart';
import 'package:katatarahatalk/pages/food/popular_food_detail.dart';
import 'package:katatarahatalk/utils/colors.dart';
import 'package:katatarahatalk/utils/dimensions.dart';
import 'package:katatarahatalk/widgets/big_text.dart';
import 'package:katatarahatalk/widgets/icon_and_text_widget.dart';
import 'package:katatarahatalk/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);


  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section with dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return Container(
            //color: Colors.redAccent,
              height: Dimensions.pageView,
              child: GestureDetector(
                onTap: (){
                  Get.to(()=>PopularFoodDetail());
                },
                child: PageView.builder(
                    controller: pageController,
                    itemCount: 5,
                    itemBuilder: (context, position){
                      return _buildPageItem(position);
                    }),
              )
          );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
              dotsCount: 5,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: Colors.greenAccent,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              )
          );
        }),
        SizedBox(height: Dimensions.height30),

        //popular text view
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26)
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing", color: Colors.black26)
              )
            ],
          ),
        ),
        //list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                    margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10 , bottom: Dimensions.width10),
                    child: Row(
                      children: [
                        Container(
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white38,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/image/homemade-tomato-cream-soup-copy-space.jpg"
                                  )
                              )
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20)
                                ),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "Nutritious fruit meal in China"),
                                  SizedBox(height: Dimensions.height10),
                                  SmallText(text: "With chinese characteristics"),
                                  SizedBox(height: Dimensions.height10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: Colors.orangeAccent
                                      ),
                                      SizedBox(width: Dimensions.width10),
                                      IconAndTextWidget(
                                          icon: Icons.location_on,
                                          text: "1.7km",
                                          iconColor: Colors.greenAccent
                                      ),
                                      SizedBox(width: Dimensions.width10),
                                      IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text: "32min",
                                          iconColor: Colors.redAccent
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                );

              }
          );
        })

      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index ==_currentPageValue.floor()){
      var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }else if(index == _currentPageValue.floor()+1){
      var currentScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix =  Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }else if(index == _currentPageValue.floor()-1){
      var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix =  Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }
    else{
      var currentScale = 0.8;
      matrix =  Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color:
                index.isEven?Color(0xFF69c5df)
                    :Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image/homemade-tomato-cream-soup-copy-space.jpg"
                    )
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0)
                    )
                  ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Homemade Tomato Cream Soup"),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: Colors.green, size: Dimensions.iconSize15);
                          }),
                        ),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "1287"),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "comments")

                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: Colors.orangeAccent
                        ),
                        SizedBox(width: Dimensions.width20),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: Colors.greenAccent
                        ),
                        SizedBox(width: Dimensions.width20),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: Colors.redAccent
                        )
                      ],
                    )

                  ],
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}
