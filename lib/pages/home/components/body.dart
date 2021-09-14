import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/components/single_food_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/pages/search/search_page.dart';
import 'package:food_delivery/services/database_service.dart';

import 'package:food_delivery/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  TabController? _tabController;
  DatabaseService _databaseService = DatabaseService();
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  // TabBarLabelList
  List tabLabelsList = ["Foods", "Drinks", "Snacks", "Sauce"];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionScreenHeight(20.0),
              ),
              // TITLE SECTION
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text("Delicious\nfood for you",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionScreenHeight(30)),

              // SEARCH SECTION
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Color(0xFFEFEEEE),
                  filled: true,
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Color(0xFF9A9A9D),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kPadding / 2),
                    child: IconButton(
                        onPressed: () {},
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                        padding: EdgeInsets.only(left: kPadding)),
                  ),
                ),
                readOnly: true,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
              SizedBox(height: getProportionScreenHeight(40)),
            ],
          ),
        ),

        //TABBAR SECTION
        Padding(
          padding: EdgeInsets.only(left: kPadding * 2),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Color(0xFFFA4A0C),
              unselectedLabelColor: Color(0xFF9A9A9D),
              indicatorColor: Color(0xFFFA4A0C),
              tabs: List.generate(
                  4, (index) => customTab("${tabLabelsList[index]}")),
            ),
          ),
        ),

        // SEE MORE SECTION
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: kPadding, top: kPadding),
            child: Text(
              "see more",
              style: TextStyle(
                  color: Color(0xFFFA4A0C),
                  fontSize: getProportionScreenWidth(15)),
            ),
          ),
        ),

        // TABBVIEW SECTION
        Expanded(
          child: Container(
            padding: EdgeInsets.only(bottom: getProportionScreenHeight(20)),
            child: TabBarView(
              controller: _tabController,
              children: [
                // FOOD'S TABVIEW SECTION
                StreamBuilder(
                  stream: _databaseService.getFood(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(color: kRedColor));
                    } else if (!snapshot.hasData) {
                      return Center(child: Text("Foods not found !"));
                    } else if (snapshot.hasData) {
                      List foodsList = snapshot.data.docs;
                      return Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: foodsList.length,
                              itemBuilder: (context, index) {
                                var _item = foodsList[index];
                                Food _food = Food(
                                  name: _item['name'],
                                  imgUrl: _item['imgUrl'],
                                  price: _item['price'],
                                );
                                return SingleFoodItem(
                                  food: _food,
                                  index: index,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      setState(() {});
                      return Text("Erros contact telegram @asadbek_0FF");
                    }
                  },
                ),

                Container(
                  alignment: Alignment.center,
                  child: Text("Drinks Tab"),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("Snacks Tab"),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("Sauce Tab"),
                ),
              ],
            ),
          ),
        ),
        //
      ],
    );
  }

  // CUSTOMTAB WIDGET
  customTab(text) => Tab(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionScreenWidth(7)),
          child: Text(
            "$text",
            style: TextStyle(
                fontSize: getProportionScreenWidth(17),
                fontWeight: FontWeight.w400),
          ),
        ),
      );
}
