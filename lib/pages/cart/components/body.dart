// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/pages/cart/components/single_order.dart';
import 'package:food_delivery/services/auth_service.dart';
import 'package:food_delivery/services/database_service.dart';
import 'package:food_delivery/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getProportionScreenHeight(10)),
          // DESCRIPTION SECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: getProportionScreenWidth(20.0),
                  child: SvgPicture.asset("assets/icons/swipe.svg")),
              Text(
                "swipe on an item to delete",
                style: TextStyle(fontSize: getProportionScreenHeight(16)),
              )
            ],
          ),
          SizedBox(height: getProportionScreenHeight(20)),
          // ORDERS SECTION
          StreamBuilder(
            stream: DatabaseService().getOrders(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: kRedColor));
              } else if (!snapshot.hasData) {
                return Container();
              } else if (snapshot.hasData) {
                var orders = snapshot.data.docs;
                List myOrders = [];
                for (var i = 0; i < orders.length; i++) {
                  if (orders[i]['userId'] ==
                      FirebaseAuth.instance.currentUser!.uid) {
                    myOrders.add(orders[i]);
                  }
                }
                return StreamBuilder(
                  stream: DatabaseService().getFood(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(color: kRedColor));
                    } else if (!snapshot.hasData) {
                      return Container();
                    } else if (snapshot.hasData) {
                      var foods = snapshot.data.docs;
                      List myFoods = [];
                      for (var x = 0; x < myOrders.length; x++) {
                        for (var i = 0; i < foods.length; i++) {
                          if (foods[i]['name'] == myOrders[x]['foodName']) {
                            myFoods.add(foods[i]);
                          }
                        }
                      }
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: getProportionScreenWidth(14.0)),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: myFoods.length,
                            itemBuilder: (context, index) {
                              var _food = Food(
                                name: myFoods[index]['name'],
                                imgUrl: myFoods[index]['imgUrl'],
                                price: myFoods[index]['price'],
                              );
                              return SingleOrder(
                                food: _food,
                                orderId: myOrders[index]['orderId'],
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Text("error");
                    }
                  },
                );
              } else {
                return Text("Error");
              }
            },
          )
        ],
      ),
    );
  }
}
