import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  BottomNavigationBarEntity(
      {required this.activeImages,
      required this.inActiveImages,
      required this.name});
  final String activeImages, inActiveImages;
  final String name;
}

List<BottomNavigationBarEntity> customBottomNavigationBarItems() {
  return [
    BottomNavigationBarEntity(
        activeImages: Assets.imagesBottomBarBoldHome,
        inActiveImages: Assets.imagesBottomBarOutlineHome,
        name: 'الرئيسية'),
    BottomNavigationBarEntity(
        activeImages: Assets.imagesBottomBarBoldProducts,
        inActiveImages: Assets.imagesBottomBarOutlineProducts,
        name: 'المنتجات'),
    BottomNavigationBarEntity(
        activeImages: Assets.imagesBottomBarBoldShoppingCart,
        inActiveImages: Assets.imagesBottomBarOutlineShoppingCart,
        name: 'سلة التسوق'),
    BottomNavigationBarEntity(
        activeImages: Assets.imagesBottomBarBoldUser,
        inActiveImages: Assets.imagesBottomBarOutlineUser,
        name: 'حسابي'),
  ];
}
