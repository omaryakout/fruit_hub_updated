part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartAdd extends CartState {}

final class CartRemove extends CartState {}

