import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/pages/auth/auth_page.dart';
import 'package:food_delivery/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kPadding),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/images/bella_olonje_logo.png"),
                  radius: 30.0,
                ),
                Text(
                  "CALEB G\nRestaurant",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(height: 1.7, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splashpic1.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "Get Stared",
                            textColor: kRedColor,
                            primary: kTextColor,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuthPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: kPadding),
        ],
      ),
    );
  }
}
