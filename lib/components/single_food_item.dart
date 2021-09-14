import 'package:flutter/material.dart';
import 'package:food_delivery/pages/food_detail/food_detail_page.dart';
import 'package:food_delivery/size_config.dart';

class SingleFoodItem extends StatelessWidget {
  final index, food;
  const SingleFoodItem({this.food, this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 400),
          pageBuilder: (context, _, __) => FoodDetailPage(food: food),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: getProportionScreenHeight(60),
          right: index == 0
              ? getProportionScreenWidth(34)
              : getProportionScreenWidth(50),
          left: index == 0 ? getProportionScreenWidth(50) : 0,
        ),
        padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(34)),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(0, -getProportionScreenHeight(60)),
              child: Container(
                width: getProportionScreenWidth(164),
                height: getProportionScreenHeight(164),
                child: Image.network(food.imgUrl),
              ),
            ),
            Text(
              food.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: getProportionScreenHeight(22.0)),
            ),
            Spacer(),
            Text(
              food.price,
              style: TextStyle(
                  color: Color(0xFFFA4A0C),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
