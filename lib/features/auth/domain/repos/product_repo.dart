import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/auth/domain/entity/product_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failures, List<ProductEntity>>> getProduct();

  Future<Either<Failures, List<ProductEntity>>> getBestSelling();
}
