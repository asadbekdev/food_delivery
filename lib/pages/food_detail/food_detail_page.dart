import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/food_detail/components/body.dart';
import 'package:food_delivery/size_config.dart';

class FoodDetailPage extends StatelessWidget {
  final food;
  const FoodDetailPage({Key? key, this.food}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F9),
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getProportionScreenWidth(34)),
            child: IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage("assets/icons/heart.png")),
              iconSize: getProportionScreenWidth(20.0),
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        toolbarHeight: getProportionScreenHeight(60.0),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Body(food: food),
    );
  }
}
