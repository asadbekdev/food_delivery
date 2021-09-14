import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/size_config.dart';

class OrderComplete extends StatelessWidget {
  const OrderComplete({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Order Complete",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: getProportionScreenHeight(34.0),
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionScreenHeight(49)),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: SvgPicture.asset("assets/icons/order_cart.svg"),
                ),
                SizedBox(height: getProportionScreenHeight(38.0)),
                Text(
                  "Thank you for  Ordering",
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
      ),
    );
  }
}
