import 'package:flutter/material.dart';
import 'package:katatarahatalk/pages/home/food_page_body.dart';
import 'package:katatarahatalk/utils/dimensions.dart';
import 'package:katatarahatalk/widgets/big_text.dart';
import 'package:katatarahatalk/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //print("The current height is: "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(

            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Sri Lanka", color: Colors.greenAccent),
                      Row(
                        children: [
                          SmallText(text: "Colombo", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded)
                        ]
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.width45,
                      child: Icon(Icons.search, color:Colors.white, size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: Colors.greenAccent,
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
          //showing the body
          Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody()
              )
          )
        ],
      ),
    );
  }
}
