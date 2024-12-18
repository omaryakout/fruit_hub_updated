import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domain/entity/product_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/product_repo.dart';

import '../../../../core/services/backendpoints.dart';
import '../../../../core/services/database_service.dart';
import '../../data/model/products_model.dart';

class ProductRepoImpl implements ProductRepo {
  DataBaseService dataBaseService;
  ProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSelling() async {
    try {
      var data = await dataBaseService.getData(
              path: BackEndpoints.addProductCollection,
              query: {'orderBy': 'ratingCount', 'desceding': true, 'limit': 10})
          as List<Map<String, dynamic>>;
      List<ProductEntity> products = data.map(
        (e) {
          return ProductsModel.fromFirebase(e).toEntity();
        },
      ).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('failed to load products'));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProduct() async {
    try {
      var data = await dataBaseService.getData(
              path: BackEndpoints.addProductCollection)
          as List<Map<String, dynamic>>;
      print(data.length);
      print(data);
      List<ProductEntity> products = data
          .map(
            (e) => ProductsModel.fromFirebase(e).toEntity(),
          )
          .toList();
      print(products.elementAt(1));
      
      return right(products);
    } catch (e) {
      return left(ServerFailure('failed to load products'));
    }
  }
}
