import 'package:flutter/material.dart';
import 'package:food_delivery/pages/splash/components/body.dart';
import 'package:food_delivery/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: Body(),
    );
  }
}
