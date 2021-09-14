// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/pages/payment/payment_page.dart';
import 'package:food_delivery/size_config.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var deliveryMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  TITLE SECTION
          Column(
            children: [
              Text(
                "Delivery",
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

          // ADDRESS SECTION
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Addres details",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: getProportionScreenWidth(17.0),
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    "change",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: getProportionScreenWidth(15.0),
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF47B0A),
                        ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: getProportionScreenHeight(20.0)),
                padding: EdgeInsets.only(
                  top: getProportionScreenHeight(25.0),
                  bottom: getProportionScreenHeight(25.0),
                  left: getProportionScreenWidth(30.0),
                  right: getProportionScreenWidth(53.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thelma Sara-bear",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    ),
                    Divider(color: Color(0xFF000000).withOpacity(0.3)),
                    Text(
                      "Trasaco hotel, behind navrongo campus",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.black,
                            fontSize: getProportionScreenWidth(13.0),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(height: getProportionScreenHeight(28.0)),
                    Divider(color: Color(0xFF000000).withOpacity(0.3)),
                    Text(
                      "+233 5413 8989",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.black,
                          fontSize: getProportionScreenWidth(15.0),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionScreenHeight(42.0)),
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PaymentPage()));
            },
          ),
          SizedBox(height: kPadding),
        ],
      ),
    );
  }
}
