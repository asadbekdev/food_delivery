import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/payment/components/body.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F8),
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "CheckOut",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}
