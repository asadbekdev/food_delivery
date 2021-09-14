import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery/pages/home/components/drawer_page.dart';
import 'package:food_delivery/pages/main/main_page.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = ZoomDrawerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _drawerController,
        menuScreen: DrawerPage(),
        mainScreen: MainPage(),
        borderRadius: 24.0,
        showShadow: true,
        mainScreenScale: -1,
        style: DrawerStyle.Style1,
        slideWidth: 200.0,
        angle: 0.0,
        backgroundColor: Colors.grey[300]!,
      ),
    );
  }
}
