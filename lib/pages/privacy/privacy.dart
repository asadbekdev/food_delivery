import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/size_config.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Privacy",
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
      
      body: Center(
        child: Text("Privacy"),
      ),
    );
  }
}
