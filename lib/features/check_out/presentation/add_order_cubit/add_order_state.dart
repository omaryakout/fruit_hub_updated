part of 'add_order_cubit.dart';

sealed class AddOrderState {
  const AddOrderState();
}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderLoading extends AddOrderState {}

final class AddOrderSuccess extends AddOrderState {}

final class AddOrderFailure extends AddOrderState {
  final String errMessge;

  AddOrderFailure({required this.errMessge});
}
