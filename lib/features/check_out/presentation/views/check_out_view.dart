import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/features/auth/domain/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/features/auth/domain/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruits_hub/features/check_out/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/check_out/presentation/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/address_input_section.dart';
import 'package:provider/provider.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/services/firestore.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../home/domain/entities/cart_item_entity.dart';
import '../../../home/domain/entities/overall_cart_entity.dart';
import '../../domain/entities/order_entity.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatefulWidget {
  CheckOutView({super.key, required this.overallCartEntity});
  static const routeName = 'CheckOutView';
  OverallCartEntity overallCartEntity;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(
        place: 'efo',
        shippingAddressEntity: ShippingAddressEntity(),
        widget.overallCartEntity,
        uid: getUser().uid);

       
    super.initState();
  }
OrdersRepo orderRepo =OrdersRepoImpl(
  dataBaseService: FireStoreDataBase( )
)  ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(ordersRepo:orderRepo ),
      child: Scaffold(
        appBar: buildAppBar(
          title: 'الشحن',
          showNotificationButton: false,
        ),
        body: Provider.value(value: orderEntity, child: CheckOutViewBody()),
      ),
    );
  }
}
