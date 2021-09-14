// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/services/database_service.dart';
import 'package:food_delivery/size_config.dart';

class SingleOrder extends StatefulWidget {
  var food, orderId;
  SingleOrder({this.food, this.orderId});

  @override
  State<SingleOrder> createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  var orderCount = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // SINGLE ORDER
    return Container(
      margin: EdgeInsets.only(bottom: kPadding),
      child: Slidable(
        key: Key(widget.orderId.toString()),
        child: Container(
          padding: EdgeInsets.only(
            top: getProportionScreenHeight(16),
            bottom: getProportionScreenHeight(16.79),
            right: getProportionScreenWidth(24),
            left: getProportionScreenWidth(17),
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: [
              // ORDER IMAGE
              Container(
                  width: getProportionScreenWidth(69),
                  child: Image.network(widget.food.imgUrl)),
              SizedBox(width: getProportionScreenWidth(20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ORDER NAME
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        widget.food.name,
                        style: TextStyle(
                            fontSize: getProportionScreenHeight(17),
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.food.price,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: getProportionScreenWidth(15),
                            color: kRedColor,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => orderCount -= 1),
                              child: Container(
                                width: getProportionScreenWidth(30.0),
                                height: getProportionScreenHeight(30.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: kRedColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                ),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getProportionScreenHeight(18.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: getProportionScreenWidth(20.0),
                              height: getProportionScreenHeight(30.0),
                              color: kRedColor,
                              alignment: Alignment.center,
                              child: Text(
                                "$orderCount",
                                style: TextStyle(
                                    fontSize: getProportionScreenWidth(14),
                                    color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => orderCount += 1),
                              child: Container(
                                width: getProportionScreenWidth(30.0),
                                height: getProportionScreenHeight(30.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: kRedColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getProportionScreenHeight(18.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actionPane: SlidableBehindActionPane(),
        movementDuration: Duration(milliseconds: 300),
        actionExtentRatio: 1 / 6,
        secondaryActions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: kRedColor,
              child: SvgPicture.asset(
                "assets/icons/heart.svg",
                color: Colors.white,
                width: getProportionScreenWidth(16),
              ),
            ),
            padding: EdgeInsets.all(0.0),
            splashColor: Colors.transparent,
            onPressed: () {},
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: kRedColor,
              child: Icon(CupertinoIcons.trash,
                  size: getProportionScreenWidth(16.0), color: Colors.white),
            ),
            padding: EdgeInsets.all(0.0),
            splashColor: Colors.transparent,
            onPressed: () {
              setState(() {
                DatabaseService().deleteOrder(widget.orderId);
              });
            },
          ),
        ],
        dismissal: SlidableDismissal(
          child: SlidableDrawerDismissal(),
          onDismissed: (actionType) {
            setState(() {
              DatabaseService().deleteOrder(widget.orderId);
            });
          },
        ),
      ),
    );
  }
}
