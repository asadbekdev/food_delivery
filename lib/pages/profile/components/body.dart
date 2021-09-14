// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/size_config.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var paymentMethods;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // INFOMATION SECTION
          sectionTitle(context, "Information"),
          Container(
            margin: EdgeInsets.only(top: getProportionScreenHeight(12)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionScreenWidth(16.0),
              vertical: getProportionScreenHeight(20.0),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getProportionScreenWidth(60.0),
                  height: getProportionScreenHeight(60.0),
                  child: Image.asset("assets/images/user.png"),
                ),
                SizedBox(width: getProportionScreenWidth(15.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thelma Sara-bear",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    SizedBox(height: getProportionScreenHeight(8.0)),
                    Text(
                      "thelma_sara-bear@gmail.com",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Color(0xFF000000).withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0),
                    ),
                    SizedBox(height: getProportionScreenHeight(8.0)),
                    Text(
                      "Trasaco hotel, behind navrongo\ncampus",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Color(0xFF000000).withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionScreenHeight(50.0)),

          //PAYMENT METHODS SECTION
          sectionTitle(context, "Payment Method"),
          Container(
            margin: EdgeInsets.only(top: getProportionScreenHeight(12)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionScreenWidth(8.0),
              vertical: getProportionScreenHeight(20.0),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                SinglePaymentMethod(
                    title: 'Card',
                    paymentMethod: "credit_card",
                    groupValue: paymentMethods,
                    color: Color(0xFFF47B0A),
                    onChanged: (v) {
                      setState(() {
                        paymentMethods = v;
                      });
                    }),
                Container(
                  width: getProportionScreenWidth(232),
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionScreenHeight(15.0)),
                  child: Divider(color: Color(0xFF000000).withOpacity(0.3)),
                ),
                SinglePaymentMethod(
                    title: 'Mobile Money (MTN,VODA)',
                    paymentMethod: "bank",
                    groupValue: paymentMethods,
                    color: Color(0xFFEB4796),
                    onChanged: (v) {
                      setState(() {
                        paymentMethods = v;
                      });
                    }),
                Container(
                  width: getProportionScreenWidth(232),
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionScreenHeight(15.0)),
                  child: Divider(color: Color(0xFF000000).withOpacity(0.3)),
                ),
                SinglePaymentMethod(
                  title: 'Pay on delivery',
                  paymentMethod: "paypal",
                  groupValue: paymentMethods,
                  color: Color(0xFF0038FF),
                  onChanged: (v) {
                    setState(() {
                      paymentMethods = v;
                    });
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          //UPDATE INFORMATION BUTTON SECTION
          CustomButton(
            text: "Update Information",
            textColor: kTextColor,
            primary: kRedColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Text sectionTitle(BuildContext context, text) {
    return Text(
      "$text",
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Color(0xFF000000),
            fontWeight: FontWeight.w400,
          ),
    );
  }
}

class SinglePaymentMethod extends StatelessWidget {
  SinglePaymentMethod(
      {Key? key,
      required this.title,
      required this.paymentMethod,
      required this.groupValue,
      required this.color,
      required this.onChanged})
      : super(key: key);
  var title, paymentMethod, groupValue, color, onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Radio<String>(
            value: paymentMethod,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: kRedColor,
          ),
        ),
        Container(
          padding: EdgeInsets.all(getProportionScreenWidth(15.0)),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            child: SvgPicture.asset("assets/icons/$paymentMethod.svg"),
          ),
        ),
        SizedBox(width: getProportionScreenHeight(8.0)),
        Text(
          "$title",
          style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w400,
              fontSize: getProportionScreenWidth(17.0)),
        ),
        SizedBox(height: getProportionScreenHeight(15.0)),
      ],
    );
  }
}
