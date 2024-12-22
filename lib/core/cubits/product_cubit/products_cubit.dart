import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entity/product_entity.dart';
import 'package:meta/meta.dart';

import '../../../features/auth/domain/repos/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());

  final ProductRepo productRepo;
  int products = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getProduct();
    result.fold(
      (failures) {
        emit(ProductsFailure(errMessage: failures.message));
        print(failures);
      },
      (products) {
        emit(ProductsSucess(products: products));
      },
    );
  }

  Future<void> getBestSelling() async {
    emit(ProductsLoading());
    var result = await productRepo.getBestSelling();
    result.fold(
      (failures) {
        emit(ProductsFailure(errMessage: failures.message));
      },
      (products) {
        emit(ProductsSucess(products: products));
      },
    );
  }
}
