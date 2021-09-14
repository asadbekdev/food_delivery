
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery/size_config.dart';

class CustomButton extends StatelessWidget {
  var text, textColor, primary, onPressed;
  CustomButton(
      {Key? key, required this.text, required this.primary, this.textColor, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            child: Text(
              "$text",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: textColor),
            ),
            style: ElevatedButton.styleFrom(
              primary: primary,
              fixedSize: Size(
                0,
                getProportionScreenHeight(80),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
