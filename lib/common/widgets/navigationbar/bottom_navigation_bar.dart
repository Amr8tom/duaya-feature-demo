import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/colors.dart';
import '../../managers/navigation_menu/navigation_menu_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: _items.length,
      height: kToolbarHeight * .9,
      tabBuilder: (int index, bool isActive) {
        return _items[index];
      },

      notchSmoothness: NotchSmoothness.softEdge, // leftCornerRadius: 32,

      activeIndex: context.read<NavigationMenuCubit>().indx,
      gapLocation: GapLocation.center,
      onTap: (index) =>
          context.read<NavigationMenuCubit>().setSelectedIndex(index),
    );
  }
}

List<Widget> _items = [
  Column(
    children: [
      Icon(Iconsax.home, color: ColorRes.greenBlue),
      Text(
        S.current.home,
        style: TextStyle(color: ColorRes.greenBlue),
      ),
    ],
  ),
  Column(
    children: [
      Icon(Iconsax.building, color: ColorRes.greenBlue),
      Text(
        S.current.companies,
        style: TextStyle(color: ColorRes.greenBlue),
      ),
    ],
  ),
  Column(
    children: [
      Icon(Iconsax.discount_circle, color: ColorRes.greenBlue),
      Text(
        S.current.flashSale,
        style: TextStyle(color: ColorRes.greenBlue),
      ),
    ],
  ),
  Column(
    children: [
      Icon(
        Iconsax.menu,
        color: ColorRes.greenBlue,
      ),
      Text(
        S.current.services,
        style: TextStyle(color: ColorRes.greenBlue),
      ),
    ],
  ),
];
