import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/services/database_service.dart';
import 'package:food_delivery/size_config.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class Body extends StatefulWidget {
  final food;
  const Body({Key? key, this.food}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController _pageController = PageController();
  ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DETAILS SECTIOn
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SLIDER SECTION
                Container(
                  height: getProportionScreenHeight(221.21),
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                          width: getProportionScreenWidth(221.21),
                          // height: getProportionScreenHeight(241.21),
                          child: Image.network(widget.food.imgUrl));
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _pageNotifier.value = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: getProportionScreenHeight(37.7)),

                // DOT INDICATOR SECTION
                Center(
                  child: CirclePageIndicator(
                    currentPageNotifier: _pageNotifier,
                    itemCount: 4,
                    dotColor: Color(0xFFC4C4C4),
                    selectedDotColor: Color(0xFFFA4A0C),
                  ),
                ),
                SizedBox(height: getProportionScreenHeight(35)),

                //TITLE SECTION
                Text(
                  widget.food.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Color(0xFF000000),
                      fontSize: getProportionScreenHeight(28.0),
                      fontWeight: FontWeight.w400,
                      height: 1.3),
                ),
                SizedBox(height: getProportionScreenHeight(12)),
                Text(
                  widget.food.price,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Color(0xFFFA4A0C),
                        fontSize: getProportionScreenHeight(22.0),
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: getProportionScreenHeight(43)),
              ],
            ),
            // INFO SECTION
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // DELIVERY INFO
                Text(
                  "Delivery info",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Delivered between monday aug and\nthursday 20 from 8pm to 91:32 pm",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFF000000).withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: getProportionScreenHeight(47.0)),
                // POLICY INFO
                Text(
                  "Return policy",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "All our foods are double checked before\nleaving our stores so by any case you found\na broken food please contact our hotline\nimmediately.",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFF000000).withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionScreenHeight(35.0)),
            // ADD TO CART BUTTON
            CustomButton(
              text: "Add to cart",
              textColor: kTextColor,
              primary: kRedColor,
              onPressed: () async {
                await DatabaseService().addOrder(widget.food.name);
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: Text("Food added to cart"),
                    actions: [
                      Text("1"),
                    ],
                  ),
                );
                ScaffoldMessenger.of(context).clearMaterialBanners();
              },
            ),
          ],
        ),
      ),
    );
  }
}
