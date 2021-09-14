import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/home/components/body.dart';
import 'package:food_delivery/size_config.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        leadingWidth: getProportionScreenWidth(80),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/shopping-cart.svg",
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage())),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            padding: EdgeInsets.only(right: getProportionScreenWidth(26)),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}
