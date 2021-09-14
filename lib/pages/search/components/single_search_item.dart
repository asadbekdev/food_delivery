// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/size_config.dart';

class SingleSearchItem extends StatelessWidget {
  var food, index;
  SingleSearchItem({this.food, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: index == 0 ? getProportionScreenHeight(35) : 0),
      child: Container(
        width: getProportionScreenWidth(156),
        height: getProportionScreenHeight(212.41),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(0, -getProportionScreenHeight(35)),
              transformHitTests: true,
              child: Container(
                width: getProportionScreenWidth(128.98),
                height: getProportionScreenHeight(128.98),
                child: Image.network(food.imgUrl),
              ),
            ),
            Container(
              width: getProportionScreenWidth(110.17),
              child: Text(
                food.name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontSize: getProportionScreenHeight(22.0),
                    ),
              ),
            ),
            Spacer(),
            Text(
              food.price,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: kRedColor, fontSize: getProportionScreenHeight(17.0)),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
