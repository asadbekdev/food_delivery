// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/pages/auth/auth_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/offers/offers.dart';
import 'package:food_delivery/pages/privacy/privacy.dart';
import 'package:food_delivery/pages/privacy/security.dart';
import 'package:food_delivery/pages/profile/profile_page.dart';
import 'package:food_delivery/services/auth_service.dart';
import 'package:food_delivery/size_config.dart';

class DrawerPage extends StatelessWidget {
  DrawerPage({Key? key}) : super(key: key);
  List menuItems = [
    ["Profile", "profile", ProfilePage()],
    ["Orders", "orders", CartPage()],
    ["offer and promo", "offer", Offers()],
    ["Privacy policy", "privacy", Privacy()],
    ["Security", "security", Security()],
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kRedColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kPadding, vertical: kPadding),
          child: Column(
            children: [
              Spacer(),
              ...List.generate(
                menuItems.length,
                (index) => Expanded(
                  child: Column(
                    children: [
                      menuItem(
                        context,
                        icon: menuItems[index][1],
                        text: menuItems[index][0],
                        route: menuItems[index][2],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                child: Row(
                  children: [
                    Text(
                      "Sign-out",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: getProportionScreenWidth(17.0),
                          ),
                    ),
                    SizedBox(width: getProportionScreenWidth(12.0)),
                    Icon(CupertinoIcons.arrow_right, color: Colors.white),
                  ],
                ),
                onTap: () async {
                  await AuthService().signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  menuItem(BuildContext context, {icon, text, route}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => route)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(child: SvgPicture.asset("assets/icons/$icon.svg")),
              SizedBox(width: getProportionScreenWidth(12.0)),
              Text(
                "$text",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionScreenWidth(17.0),
                    ),
              ),
            ],
          ),
          Container(
              width: getProportionScreenWidth(132.0),
              margin: EdgeInsets.only(left: getProportionScreenWidth(40.0)),
              child: Divider(height: 52.0, color: Color(0xFFF4F4F8))),
        ],
      ),
    );
  }
}
