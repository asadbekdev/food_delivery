import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: SvgPicture.asset("assets/icons/history2.svg"),
              ),
              SizedBox(height: getProportionScreenHeight(38.0)),
              Text(
                "No history yet",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: getProportionScreenHeight(28.0),
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionScreenHeight(38.0)),
              Text(
                "Hit the orange button down\n below to Create an order",
                style: TextStyle(
                  color: Color(0xFFADADAF),
                  fontSize: getProportionScreenHeight(17),
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
