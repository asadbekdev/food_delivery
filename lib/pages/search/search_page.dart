import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/search/components/body.dart';
import 'package:food_delivery/size_config.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 15.0),
          child: IconButton(
            icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.all(0.0),
          ),
        ),
        leadingWidth: getProportionScreenWidth(40.0),
        title: TextFormField(
          decoration: InputDecoration(
            fillColor: Color(0xFFEFEEEE),
            filled: true,
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: Color(0xFF9A9A9D),
                fontWeight: FontWeight.w400,
                fontSize: 16.0),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.all(0.0),
          ),
          scrollPadding: EdgeInsets.all(0.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}
