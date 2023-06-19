import 'package:flutter/material.dart';
import 'package:flutter_ec_project/screens/cart_screen/cart_screen.dart';
import 'package:flutter_ec_project/screens/favourite_screen/favourite_screen.dart';
import 'package:flutter_ec_project/screens/home/home.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomButtomBar extends StatefulWidget {
  const CustomButtomBar({final Key? key,})
      : super(key: key);

  @override
  _CustomButtomBarState createState() => _CustomButtomBarState();
}

class _CustomButtomBarState extends State<CustomButtomBar> {
  PersistentTabController _controller = PersistentTabController();
  bool _hideNavBar = false;


  List<Widget> _buildScreens() => [
    Home(),
    CartScreen(),
    FavouriteScreen(),
    FavouriteScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        inactiveIcon: const Icon(Icons.home_outlined),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_cart),
      inactiveIcon: const Icon(Icons.shopping_cart_outlined),
      title: "Cart",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.favorite),
      inactiveIcon: const Icon(Icons.favorite_border),
      title: "Favourite",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      inactiveIcon: const Icon(Icons.person_outline),
      title: "Profile",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),

  ];

  @override
  Widget build(final BuildContext context) => Scaffold(

    body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      bottomScreenMargin: 0,
      backgroundColor: Theme.of(context).primaryColor,
      hideNavigationBar: _hideNavBar,
      decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle
          .style1, // Choose the nav bar style with this property
    ),
  );
}
