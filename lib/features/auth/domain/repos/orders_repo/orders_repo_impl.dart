import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domain/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/features/check_out/domain/entities/order_entity.dart';

import '../../../../../core/services/backendpoints.dart';
import '../../../../../core/services/database_service.dart';
import '../../../../check_out/data/models/order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DataBaseService dataBaseService;
  OrdersRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failures, void>> addOrders({required OrderEntity order}) async {
    try {
      await dataBaseService.addData(
          path: BackEndpoints.orders,
          data: OrderModel.fromOrderProductModel(order).toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
