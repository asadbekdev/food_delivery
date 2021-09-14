// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/pages/payment/components/order_complete.dart';
import 'package:food_delivery/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var paymentMethod, groupValue, deliveryMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE SECTION
          Column(
            children: [
              Text(
                "Payment",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontSize: getProportionScreenWidth(34.0),
                      fontWeight: FontWeight.w400,
                    ),
                strutStyle: StrutStyle(height: 2),
              ),
              SizedBox(height: getProportionScreenHeight(45)),
            ],
          ),

          // PAYMENT METHODS SECTION
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment methods",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: getProportionScreenWidth(17.0),
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Container(
                margin: EdgeInsets.only(top: getProportionScreenHeight(20.0)),
                padding: EdgeInsets.symmetric(
                  vertical: getProportionScreenHeight(21.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: "card",
                          groupValue: paymentMethod,
                          activeColor: kRedColor,
                          onChanged: (v) => setState(() => paymentMethod = v),
                        ),
                        Container(
                          padding:
                              EdgeInsets.all(getProportionScreenWidth(15.0)),
                          decoration: BoxDecoration(
                            color: Color(0xFFF47B0A),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            child: SvgPicture.asset(
                                "assets/icons/credit_card.svg"),
                          ),
                        ),
                        SizedBox(width: getProportionScreenWidth(10.0)),
                        Text(
                          "Card",
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: getProportionScreenWidth(17.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: kPadding * 2),
                      child: Container(
                        width: getProportionScreenWidth(232),
                        child:
                            Divider(color: Color(0xFF000000).withOpacity(0.3)),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: "bank",
                          groupValue: paymentMethod,
                          activeColor: kRedColor,
                          onChanged: (v) => setState(() => paymentMethod = v),
                        ),
                        Container(
                          padding:
                              EdgeInsets.all(getProportionScreenWidth(15.0)),
                          decoration: BoxDecoration(
                              color: Color(0xFFEB4796),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            child: SvgPicture.asset("assets/icons/bank.svg"),
                          ),
                        ),
                        SizedBox(width: getProportionScreenWidth(10.0)),
                        Text(
                          "Mobile Money (MTN,VODA)",
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: getProportionScreenWidth(17.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionScreenHeight(57.0)),
            ],
          ),

          // DELIVERY METHOD SECTION
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery method.",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: getProportionScreenWidth(17.0),
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Container(
                margin: EdgeInsets.only(top: getProportionScreenHeight(20.0)),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionScreenWidth(11.0),
                    vertical: getProportionScreenHeight(30.0)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: getProportionScreenHeight(45),
                      child: RadioListTile(
                        title: Text(
                          "Door Delivery",
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: getProportionScreenWidth(17.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        value: "Door Delivery",
                        groupValue: deliveryMethod,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        activeColor: kRedColor,
                        onChanged: (v) => setState(() => deliveryMethod = v),
                      ),
                    ),
                    Container(
                      width: getProportionScreenWidth(232),
                      child: Divider(color: Color(0xFF000000).withOpacity(0.3)),
                    ),
                    Container(
                      height: getProportionScreenHeight(45),
                      child: RadioListTile(
                        title: Text(
                          "Pick up",
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: getProportionScreenWidth(17.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        value: "Pick Up",
                        groupValue: deliveryMethod,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        activeColor: kRedColor,
                        onChanged: (v) => setState(() => deliveryMethod = v),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // TOTAL COST SECTION
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: getProportionScreenWidth(17.0),
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Text(
                "23,000",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: getProportionScreenWidth(22.0),
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          Spacer(),

          //PROCEED PAYMENT BUTTON SECTION
          CustomButton(
            text: "Proceed to payment",
            textColor: kTextColor,
            primary: kRedColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionScreenWidth(46.0),
                          vertical: getProportionScreenHeight(17.0),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFEDEDED),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                        ),
                        child: Text(
                          "Please note",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: getProportionScreenWidth(20.0),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionScreenWidth(46.0),
                            vertical: getProportionScreenHeight(17.0)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("DELIVERY TO TRASACO",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontSize: getProportionScreenWidth(15.0),
                                      color: Color(0xFF000000).withOpacity(0.5),
                                      fontWeight: FontWeight.w400,
                                    )),
                            Text("GHS 2 - GH 3",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontSize: getProportionScreenWidth(15.0),
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w400,
                                    )),
                            Divider(
                                height: getProportionScreenHeight(34.0),
                                color: Color(0xFF000000).withOpacity(0.5)),
                            Text("DELIVERY TO CAMPUS",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontSize: getProportionScreenWidth(15.0),
                                      color: Color(0xFF000000).withOpacity(0.5),
                                      fontWeight: FontWeight.w400,
                                    )),
                            Text("GHS 1",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontSize: getProportionScreenWidth(15.0),
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w400,
                                    )),
                            SizedBox(height: getProportionScreenHeight(34.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  child: Text("Cancel",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.w600,
                                          )),
                                  style: TextButton.styleFrom(
                                    primary: Colors.transparent,
                                    elevation: 0.0,
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ElevatedButton(
                                  child: Text(
                                    "Proceed",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: kRedColor,
                                      elevation: 0.0,
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              getProportionScreenHeight(17.0),
                                          horizontal:
                                              getProportionScreenWidth(43.0)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderComplete()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(height: kPadding),
        ],
      ),
    );
  }
}
