import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/pages/favourite/favourite_page.dart';
import 'package:food_delivery/pages/history/history_page.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/profile/profile_page.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List pagesList = [HomePage(), OrdersPage(), ProfilePage(), HistoryPage()];
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: HomePage(),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Color(0xFFF2F2F2),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: kRedColor,
          unselectedItemColor: Color(0xFFADADAF),
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrdersPage()));
            } else if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            } else if (index == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryPage()));
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
