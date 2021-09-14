// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/components/single_food_item.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/pages/search/components/single_search_item.dart';
import 'package:food_delivery/services/database_service.dart';
import 'package:food_delivery/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: kPadding),
      margin: EdgeInsets.only(top: kPadding),
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Found 6 results",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(height: getProportionScreenHeight(30.0)),
          StreamBuilder(
            stream: _databaseService.getFood(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: kRedColor));
              } else if (!snapshot.hasData) {
                return Center(child: Text("Foods not found !"));
              } else if (snapshot.hasData) {
                List foodsList = snapshot.data.docs;
                return Container(
                  child: StaggeredGridView.countBuilder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    itemCount: foodsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var _item = foodsList[index];
                      Food _food = Food(
                        name: _item['name'],
                        imgUrl: _item['imgUrl'],
                        price: _item['price2'],
                      );
                      // return SingleSearchItem(
                      //   food: _food,
                      //   index: index,
                      // );
                      return Column(
                        children: [
                          index.isOdd
                              ? SizedBox(
                                  height: getProportionScreenHeight(50.0),
                                )
                              : Container(),
                          SingleSearchItem(
                            food: _food,
                            index: index,
                          ),
                        ],
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, 2.65),
                    mainAxisSpacing: 4.0,
                    // crossAxisSpacing: 6.0,
                  ),
                );
              } else {
                return Text("Error contact telegram @asadbek_0FF");
              }
            },
          ),
        ],
      ),
    );
  }
}
