import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_hub/core/helper_functions/colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/fruit_item.dart';
import 'package:fruits_hub/features/auth/domain/repos/product_repo.dart';
import 'package:fruits_hub/features/best_selling_faeature/views/best_selling_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/grid_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view_body.dart';
import '../../../../core/services/get_it.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import 'widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_entity.dart';
// import 'package:flutter_svg/flutter_svg.dart' as svg;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            name: bottomNavigationBarEntity.name,
            image: bottomNavigationBarEntity.activeImages,
          )
        : InActiveItem(name: bottomNavigationBarEntity.inActiveImages);
  }
}

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(name);
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 78,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: ShapeDecoration(
              color: const Color(0xFF1B5E37),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Center(child: SvgPicture.asset(image)),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            name,
            style:
                AppTextStyle.semiBold11.copyWith(color: AppColor.primaryColors),
          )
        ],
      ),
    );
  }
}
