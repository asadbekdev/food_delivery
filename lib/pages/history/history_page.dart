import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/pages/history/components/body.dart';
import 'package:food_delivery/size_config.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
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
        title: Text(
          "History",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
        toolbarHeight: getProportionScreenHeight(100.0),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Body(),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPadding),
        child: CustomButton(
          text: "Start Ordering",
          primary: kRedColor,
          textColor: kTextColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
