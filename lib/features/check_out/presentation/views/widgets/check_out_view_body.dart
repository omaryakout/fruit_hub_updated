import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/check_out/presentation/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/check_out_steps.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/inactive_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/shipping_section.dart';
import 'package:provider/provider.dart';
import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/entities/order_entity.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late PageController pageController;
  int currentPageIndex = 0;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      if (pageController.hasClients) {
        setState(() {
          currentPageIndex = pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: CheckOutSteps(
                pageIndex: currentPageIndex,
                pageController: pageController,
              ),
            ),
            Expanded(
                child: CheckoutStepsPageView(
              valueListenable: valueNotifier,
              formKey: formKey,
              pageController: pageController,
            )),
            CustomButton(
              onPressed: () {
                var orderEntity = context.read<OrderEntity>();
                if (pageController.page == 0) {
                  _selectShippingMethod(context);
                } else if (pageController.page == 1) {
                  _handleshippingAddress();
                }
                context.read<AddOrderCubit>().addData(order: orderEntity);
              },
              text: Text(
                getButtonText(),
                style: AppTextStyle.bold13.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        );
      },
    );
  }

  void _selectShippingMethod(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      buildError(context, 'برجاء اختيار طريقة للدفع');
    }
  }

  void _handleshippingAddress() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(currentPageIndex + 1,
          duration: Duration(milliseconds: 400), curve: Curves.bounceIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  String getButtonText() {
    if (pageController.hasClients) {
      switch (currentPageIndex) {
        case 0:
          return 'التالي';
        case 1:
          return 'التالي';
        case 2:
          return 'ادفع باستخدام paypal';

        default:
          return 'التالي';
      }
    } else {
      return 'التالي';
    }
  }
}





// class CheckOutViewBody extends StatefulWidget {
//   const CheckOutViewBody({super.key});

//   @override
//   State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
// }

// class _CheckOutViewBodyState extends State<CheckOutViewBody> {
//   late PageController pageController;
//   int currentPageIndex = 0;

//   @override
//   void initState() {
//     pageController = PageController();

//     pageController.addListener(() {
//       if (pageController.hasClients) {
//         setState(() {
//           currentPageIndex = pageController.page!.round();
//         });
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: CheckOutSteps(
//             pageIndex: currentPageIndex,
//             pageController: pageController,
//           ),
//         ),
//         Expanded(
//           child: CheckoutStepsPageView(
//             pageController: pageController,
//           ),
//         ),
//         CustomButton(
//           onPressed: () {
//             if (pageController.hasClients &&
//                 currentPageIndex < getPages().length - 1) {
//               pageController.nextPage(
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//               );
//             }
//           },
//           text: Text(
//             getButtonText(),
//             style: AppTextStyle.bold13.copyWith(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 32),
//       ],
//     );
//   }

//   String getButtonText() {
//     switch (currentPageIndex) {
//       case 0:
//         return 'التالي';
//       case 1:
//         return 'التالي';
//       case 2:
//         return 'ادفع باستخدام paypal';
//       default:
//         return 'التالي';
//     }
//   }
// }

// List<Widget> getPages() {
//   return [
//     const ShippingSection(),
//     AddressInputSection(),
//     const PaymentSection(),
//   ];
// }
