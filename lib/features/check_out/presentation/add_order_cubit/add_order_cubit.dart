import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../auth/domain/repos/orders_repo/orders_repo.dart';
import '../../domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.ordersRepo}) : super(AddOrderInitial());
  OrdersRepo ordersRepo;

  Future<void> addData({required OrderEntity order}) async {
    emit(AddOrderLoading());

    var result = await ordersRepo.addOrders(order: order);
    result.fold(
      (l) => emit(AddOrderFailure(errMessge: l.message)),
      (r) => emit(AddOrderSuccess()),
    );
  }
}
