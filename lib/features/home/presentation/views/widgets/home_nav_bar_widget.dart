import 'package:dalel/core/theme/app_colors.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeView(),
      CartView(),
      SearchView(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesHomeActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.imagesHomeInacitveIcon),
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.imagesCartInactiveIcon),
        icon: SvgPicture.asset(Assets.imagesCartActiveIcon),
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.imagesSearchInactiveIcon),
        icon: SvgPicture.asset(Assets.imagesSearchActiveIcon),
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(Assets.imagesProfileInactiveIcon),
        icon: SvgPicture.asset(Assets.imagesProfileActiveIcon),
      ),
    ];
  }
}
