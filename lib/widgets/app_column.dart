import 'package:flutter/material.dart';
import 'package:katatarahatalk/utils/dimensions.dart';
import 'package:katatarahatalk/widgets/big_text.dart';
import 'package:katatarahatalk/widgets/icon_and_text_widget.dart';
import 'package:katatarahatalk/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
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
    );
  }
}
