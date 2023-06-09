import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:monvoyage/account/account.dart';
import 'package:monvoyage/settings/settings.dart';
import 'package:monvoyage/tabs/tabs-pages/home.dart';
import 'package:monvoyage/tabs/tabs-pages/travels.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Tabs extends StatefulWidget {
  final index;
  const Tabs(int this.index, {Key? key}) : super(key: key);
  
  @override
  State<Tabs> createState() => _TabsState(index);
}

class _TabsState extends State<Tabs> {

  _TabsState(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: index);
    final iconSize = 27.0;

    List<Widget> _buildScreens() {
        return [
          HomePage(),
          Travels(),
          Account(),
          Settings(),
        ];
    }
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const Icon(FluentIcons.home_24_regular),
                title: ("Accueil"),
                activeColorPrimary: Color(0xFF1b9676),
                inactiveColorPrimary: Color(0xffc2c2c2),
                iconSize: iconSize,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(FluentIcons.ticket_diagonal_24_regular),
                title: ("Mes voyages"),
                activeColorPrimary: Color(0xFF1b9676),
                inactiveColorPrimary: Color(0xffc2c2c2),
                iconSize: iconSize
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(LucideIcons.users),
                title: ("Mon compte"),
                activeColorPrimary: Color(0xFF1b9676),
                inactiveColorPrimary: Color(0xffc2c2c2),
                iconSize: iconSize
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(FluentIcons.settings_24_regular),
                title: ("Paramétres"),
                activeColorPrimary: Color(0xFF1b9676),
                inactiveColorPrimary: Color(0xffc2c2c2),
                iconSize: iconSize,
            )
        ];
    }

    return Scaffold(body:PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
        ),
        navBarStyle: NavBarStyle.style8, // Choose the nav bar style with this property.
    ));
  }
}