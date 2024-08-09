import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../generated/l10n.dart';
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
      Icon(Iconsax.home),
      Text(S.current.home),
    ],
  ),
  Column(
    children: [
      Icon(Iconsax.building),
      Text(S.current.companies),
    ],
  ),
  Column(
    children: [
      Icon(Iconsax.discount_circle),
      Text(S.current.flashSale),
    ],
  ),
  Column(
    children: [
      Icon(Iconsax.menu),
      Text(S.current.services),
    ],
  ),
];
