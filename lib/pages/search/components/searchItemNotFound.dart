import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/size_config.dart';

class SearchItemNotFound extends StatelessWidget {
  const SearchItemNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: SvgPicture.asset("assets/icons/feather_search.svg"),
              ),
              SizedBox(height: getProportionScreenHeight(38.0)),
              Text(
                "Item not found",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: getProportionScreenHeight(28.0),
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionScreenHeight(16.0)),
              Text(
                "Try searching the item with\n a different keyword.",
                style: TextStyle(
                  color: Color(0xFFADADAF),
                  fontSize: getProportionScreenHeight(17),
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
