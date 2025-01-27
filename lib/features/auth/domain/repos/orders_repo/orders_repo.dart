import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/check_out/domain/entities/order_entity.dart';

import '../../../../../core/errors/failures.dart';

abstract class OrdersRepo {
  Future<Either<Failures, void>> addOrders({required OrderEntity order});
}
