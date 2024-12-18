import 'package:flutter/material.dart';

import '../home_view.dart';
import '../products_view.dart';

class MainViewBody extends StatefulWidget {
  MainViewBody({super.key, required this.index});
  int index;
  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  Widget returnBodyPage(int bodyIndex) {
    if (bodyIndex == 0) {
      return const HomeView();
    } else {
      return ProductsView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return returnBodyPage(widget.index);
  }
}




// IndexedStack(
//       index:widget. index,
//       children: [
//         HomeView(),
             
//              ProductsView(),
//       ],
//     ) ;